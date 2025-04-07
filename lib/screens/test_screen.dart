import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter_map/flutter_map.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:onnxruntime/onnxruntime.dart';
import 'package:project/core/components.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late OrtSession session;
  bool isModelLoaded = false;
  File? _selectedImage;
  late final MapController _mapController;
  double _currentZoom = 6.0;


  @override
  void initState() {
    super.initState();
    //_loadModel();
    _mapController = MapController();
  }

  void _zoomIn() {
    setState(() {
      _currentZoom = (_currentZoom + 1).clamp(2.0, 18.0);
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom = (_currentZoom - 1).clamp(2.0, 18.0);
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _loadModel() async {
    try {
      OrtEnv.instance.init();
      final sessionOptions = OrtSessionOptions();
      const assetFileName = 'assets/onnx/model.onnx';
      final rawAssetFile = await rootBundle.load(assetFileName);
      final bytes = rawAssetFile.buffer.asUint8List();
      session = OrtSession.fromBuffer(bytes, sessionOptions);
      setState(() {
        isModelLoaded = true;
      });
      print("Model loaded successfully");
      print("Input Names: ${session.inputNames}");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> _runInference(File imageFile) async {
    if (!isModelLoaded) {
      print("Model not loaded yet.");
      return;
    }

    try {
      // Define input shape based on your ONNX model
      final inputTensor = await _preprocessImage(imageFile);
      final shape = [1, 3, 224, 224];

      final inputOrt = OrtValueTensor.createTensorWithDataList(inputTensor, shape);
      final inputs = {session.inputNames.first: inputOrt}; // Use correct input name

      final runOptions = OrtRunOptions();
      dynamic outputs = await session.runAsync(runOptions, inputs);

      // Process Outputs
      outputs.forEach((value) {
        print("Output: ${value.toString()}");
        print("Output: ${value.value[0]}");

        dynamic value1 = value.value[0];

        dynamic softValue = softmax(value1);
        print("Output Soft: ${softValue}");


        dynamic argValue = argmax(softValue);
        print("Output Arg: ${argValue}");

      });

      // Release resources
      inputOrt.release();
      runOptions.release();
      outputs?.forEach((value) => value?.release());
    } catch (e) {
      print("Error during inference: $e");
    }
  }



  Future<Float32List> _preprocessImage(File imageFile) async {
    // Load image as Uint8List
    final Uint8List imageBytes = await imageFile.readAsBytes();

    // Decode image
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception("Failed to decode image.");
    }

    // Resize image to match model input shape (e.g., 224x224)
    final img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Convert image pixels to Float32List
    final Float32List inputTensor = Float32List(1 * 3 * 224 * 224);
    int pixelIndex = 0;

    for (int y = 0; y < 224; y++) {
      for (int x = 0; x < 224; x++) {
        final pixel = resizedImage.getPixel(x, y);

        // Extract RGB values
        final r = img.getRed(pixel) / 255.0; // Normalize [0,1]
        final g = img.getGreen(pixel) / 255.0;
        final b = img.getBlue(pixel) / 255.0;

        // ONNX expects channel-first format (C, H, W)
        inputTensor[pixelIndex] = r;
        inputTensor[pixelIndex + 224 * 224] = g;
        inputTensor[pixelIndex + 2 * 224 * 224] = b;
        pixelIndex++;
      }
    }

    return inputTensor;
  }


  List<double> softmax(List<double> inputs) {
    double sumExp = inputs.map((x) => exp(x)).reduce((a, b) => a + b);
    return inputs.map((x) => exp(x) / sumExp).toList();
  }

  int argmax(List<double> inputs) {
    return inputs.indexOf(inputs.reduce((a, b) => a > b ? a : b));
  }

  @override
  void dispose() {
    // session.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OpenStreetMap - Egypt")),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(26.8206, 30.8025),
              zoom: _currentZoom,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: LatLng(30.0444, 31.2357), // Cairo
                    child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                  ),
                ],
              ),
            ],
          ),

          // Zoom Buttons
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  onPressed: _zoomIn,
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: _zoomOut,
                  child: Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// [Plastic, Glass, Metal]