import 'dart:io';

import 'package:onnxruntime/onnxruntime.dart';

class ModelStates{
  late OrtSession session;
  bool isModelLoaded = false;
  File? selectedImage;
  String? selectedImageCategoryResult;
  int selectedImageCount = 1;

  List<String> Categories = ["Glass", "Can", "Plastic"];
  
}