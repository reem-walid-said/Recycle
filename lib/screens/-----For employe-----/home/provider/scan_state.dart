import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:project/models/category.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/models/user.dart';

class ScanStates{

  List<DropdownMenuEntry> myCategories = [
    DropdownMenuEntry(value: Category(points: 100, type: "Plastic"), label: "Plastic"),
    DropdownMenuEntry(value: Category(points: 200, type: "Can"), label: "Can"),
    DropdownMenuEntry(value: Category(points: 300, type: "Glass"), label: "Glass"),
  ];

  TextEditingController dropDownMenuController = TextEditingController();
  Category? selectedCategory;

  TextEditingController itemNameController = TextEditingController();
  int selectedNumber = 0;


  List<RecycleItem>myScannedItem = [];
  int totalScannedItemsPoints = 0;
  int totalScannedPlasticItems = 0;
  int totalScannedCanItems = 0;
  int totalScannedGlassItems = 0;



  MobileScannerController cameraController = MobileScannerController();
  String? scannedId;

  User? scannedUser;

  bool onConfirming = false;
}