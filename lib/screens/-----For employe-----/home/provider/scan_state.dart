import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:project/models/category.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/models/user.dart';

class ScanStates{

  List<DropdownMenuEntry> myCategoriesDDM = [
    DropdownMenuEntry(value: Category(points: 10, type: "Metal"), label: "Metal"),
    DropdownMenuEntry(value: Category(points: 20, type: "Plastic"), label: "Plastic"),
    DropdownMenuEntry(value: Category(points: 25, type: "Glass"), label: "Glass"),
  ];

  Map<String, int> myCategoriesMap = {
    "Metal" : 10,
    "Plastic" : 20,
    "Glass" : 25,
  };

  TextEditingController dropDownMenuController = TextEditingController();
  Category? selectedCategory;

  // TextEditingController itemNameController = TextEditingController();
  int selectedNumber = 0;


  List<RecycleItem>myScannedItem = [];
  int totalScannedItemsPoints = 0;
  int totalScannedPlasticItems = 0;
  int totalScannedMetalItems = 0;
  int totalScannedGlassItems = 0;



  MobileScannerController cameraController = MobileScannerController();
  String? scannedId;

  User? scannedUser;

  bool onConfirming = false;
}