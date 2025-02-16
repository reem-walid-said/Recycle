import 'package:flutter/material.dart';
import 'package:project/models/category.dart';
import 'package:project/models/recycle_item.dart';

class ScanStates{

  List<DropdownMenuEntry> myCategories = [
    DropdownMenuEntry(value: Category(points: 100, type: "Bottle"), label: "Bottle"),
    DropdownMenuEntry(value: Category(points: 200, type: "Can"), label: "Can"),
    DropdownMenuEntry(value: Category(points: 300, type: "Glass"), label: "Glass"),
  ];

  Category? selectedCategory;

  TextEditingController itemNameController = TextEditingController();
  int selectedNumber = 1;

  List<RecycleItem>myScannedItem = [];
  int totalScannedItemsPoints = 0;

}