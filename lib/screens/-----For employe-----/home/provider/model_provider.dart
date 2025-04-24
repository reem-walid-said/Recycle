import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onnxruntime/onnxruntime.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/model_state.dart';

class ModelProvider extends ChangeNotifier{

  ModelProvider(){
    loadModel();
  }

  ModelStates state = ModelStates();

  Future<void> loadModel() async {
    print("Model loading...");
    try {
      OrtEnv.instance.init();
      final sessionOptions = OrtSessionOptions();
      const assetFileName = 'assets/onnx/garbage_classifier.onnx';
      final rawAssetFile = await rootBundle.load(assetFileName);
      final bytes = rawAssetFile.buffer.asUint8List();
      state.session = OrtSession.fromBuffer(bytes, sessionOptions);
      state.isModelLoaded = true;
      notifyListeners();
      print("Model loaded successfully");
      print("Input Names: ${state.session.inputNames}");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      state.selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      state.selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }


  Future<void> runInference() async {
    if (!state.isModelLoaded) {
      print("Model not loaded yet.");
      return;
    }

    try {
      state.selectedImageCategoryResult = null;
      notifyListeners();
      // Define input shape based on your ONNX model
      final inputTensor = await transformImageToTensor(state.selectedImage!);
      final shape = [1, 3, 256, 256];

      final inputOrt = OrtValueTensor.createTensorWithDataList(inputTensor, shape);
      final inputs = {state.session.inputNames.first: inputOrt};

      final runOptions = OrtRunOptions();
      dynamic outputs = await state.session.runAsync(runOptions, inputs);

      // Process Outputs
      outputs.forEach((value) {
        print("Output: ${value.toString()}");
        print("Output: ${value.value[0]}");

        dynamic value1 = value.value[0];

        List<double> softValue = softmax(value1);
        print("Output Soft: ${softValue}")  ;

        dynamic argValue = argmax(softValue);
        print("Output Arg: ${argValue}");

        print("Category Result: ${categoryResult(argValue)}");
        state.selectedImageCategoryResult = categoryResult(argValue);
      });

      // Release resources
      inputOrt.release();
      runOptions.release();
      outputs?.forEach((value) => value?.release());
      notifyListeners();
    } catch (e) {
      print("Error during inference: $e");
    }
  }

  Future<Float32List> preprocessImage(File imageFile) async {
    // Load image with maximum quality preservation
    final Uint8List imageBytes = await imageFile.readAsBytes();
    final img.Image? image = img.decodeImage(imageBytes);
    if (image == null) throw Exception("Failed to decode image.");

    // High-quality resizing with Lanczos interpolation (best for downscaling)
    final img.Image resizedImage = img.copyResize(
      image,
      width: 256,
      height: 256,
    );

    // Convert to CHW format with optimized memory access
    final Float32List pixelData = Float32List(3 * 256 * 256);

    // Common normalization values (ImageNet)
    const mean = [0.485, 0.456, 0.406];
    const std = [0.229, 0.224, 0.225];

    // Pre-calculate strides for faster access
    final channelStride = 256 * 256;
    final rowStride = 256;

    // Process all pixels with minimal conversions
    for (int y = 0; y < 256; y++) {
      for (int x = 0; x < 256; x++) {
        final pixel = resizedImage.getPixel(x, y);

        // Get channels with one pixel access
        final r = img.getRed(pixel) / 255.0;
        final g = img.getGreen(pixel) / 255.0;
        final b = img.getBlue(pixel) / 255.0;

        // Normalize and store in CHW order
        pixelData[y * rowStride + x] = (r - mean[0]) / std[0];           // R channel
        pixelData[channelStride + y * rowStride + x] = (g - mean[1]) / std[1]; // G channel
        pixelData[2 * channelStride + y * rowStride + x] = (b - mean[2]) / std[2]; // B channel
      }
    }

    return pixelData;
  }

  Future<Float32List> prepareImageForOnnx(File imageFile) async {
    // 1. Load and decode image
    final image = img.decodeImage(await imageFile.readAsBytes())!;

    // 2. Resize to 256x256
    final resized = img.copyResize(image, width: 256, height: 256);

    // 3. Prepare Float32 array (256x256x3)
    final data = Float32List(256 * 256 * 3);

    // 4. Normalize pixels (ImageNet standardization)
    int index = 0;
    for (var y = 0; y < 256; y++) {
      for (var x = 0; x < 256; x++) {
        final pixel = resized.getPixel(x, y);
        // RGB channels with ImageNet normalization
        data[index++] = (img.getRed(pixel)/255.0 - 0.485) / 0.229;   // Red
        data[index++] = (img.getGreen(pixel)/255.0 - 0.456) / 0.224; // Green
        data[index++] = (img.getBlue(pixel)/255.0 - 0.406) / 0.225;  // Blue
      }
    }

    return data;
  }

  Future<Float32List> transformImageToTensor(File imageFile) async {
    // 1. Read and decode the image
    final originalImage = img.decodeImage(await imageFile.readAsBytes());
    if (originalImage == null) {
      throw Exception('Failed to decode image');
    }

    // 2. Resize to 256x256
    final resizedImage = img.copyResize(originalImage, width: 256, height: 256);

    // 3. Convert to Float32List tensor with shape [3, 256, 256]
    // Allocate the tensor (3 channels × 256 height × 256 width)
    final tensor = Float32List(3 * 256 * 256);

    // Get image bytes in RGB format
    final bytes = resizedImage.getBytes(format: img.Format.rgb);

    // Reorganize into channel-first format and normalize to [0, 1]
    for (int y = 0; y < 256; y++) {
      for (int x = 0; x < 256; x++) {
        final pixelOffset = (y * 256 + x) * 3;

        // Red channel (index 0)
        tensor[y * 256 + x] = bytes[pixelOffset] / 255.0;

        // Green channel (index 1)
        tensor[256 * 256 + y * 256 + x] = bytes[pixelOffset + 1] / 255.0;

        // Blue channel (index 2)
        tensor[2 * 256 * 256 + y * 256 + x] = bytes[pixelOffset + 2] / 255.0;
      }
    }

    return tensor;
  }


  List<double> softmax(List<double> inputs) {
    double sumExp = inputs.map((x) => exp(x)).reduce((a, b) => a + b);
    return inputs.map((x) => exp(x) / sumExp).toList();
  }

  int argmax(List<double> inputs) {
    return inputs.indexOf(inputs.reduce((a, b) => a > b ? a : b));
  }

  String categoryResult(int value){
    if(value < 3)
      return state.Categories[value];
    else{
      return "Unknown";
    }
  }

  void reset(){
    state.selectedImageCategoryResult = null;
    state.selectedImage = null;
    state.selectedImageCount = 1;

    notifyListeners();
  }

  void increaseCount(){
    if(state.selectedImageCount == 100){
      return;
    }
    state.selectedImageCount++;
    notifyListeners();
  }

  void decreaseCount(){
    if(state.selectedImageCount == 1){
      return;
    }
    state.selectedImageCount--;
    notifyListeners();
  }
}