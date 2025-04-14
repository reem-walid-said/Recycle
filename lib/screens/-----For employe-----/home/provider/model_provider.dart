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
    try {
      OrtEnv.instance.init();
      final sessionOptions = OrtSessionOptions();
      const assetFileName = 'assets/onnx/model.onnx';
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
      final inputTensor = await preprocessImage(state.selectedImage!);
      final shape = [1, 3, 224, 224];

      final inputOrt = OrtValueTensor.createTensorWithDataList(inputTensor, shape);
      final inputs = {state.session.inputNames.first: inputOrt};

      final runOptions = OrtRunOptions();
      dynamic outputs = await state.session.runAsync(runOptions, inputs);

      // Process Outputs
      outputs.forEach((value) {
        print("Output: ${value.toString()}");
        print("Output: ${value.value[0]}");

        dynamic value1 = value.value[0];

        dynamic softValue = softmax(value1);
        print("Output Soft: ${softValue}");

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
    final Uint8List imageBytes = await imageFile.readAsBytes();

    // Decode image
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception("Failed to decode image.");
    }

    // Resize image to 224x224 without altering colors or quality
    final img.Image resizedImage = img.copyResize(
      image,
      width: 224,
      height: 224,
      interpolation: img.Interpolation.average, // Ensures smoother resizing
    );

    // Convert image to Float32List without normalization or channel rearrangement
    final Float32List pixelData = Float32List(224 * 224 * 3);
    int index = 0;

    for (int y = 0; y < 224; y++) {
      for (int x = 0; x < 224; x++) {
        final pixel = resizedImage.getPixel(x, y);
        pixelData[index++] = img.getRed(pixel).toDouble();
        pixelData[index++] = img.getGreen(pixel).toDouble();
        pixelData[index++] = img.getBlue(pixel).toDouble();
      }
    }

    return pixelData;
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