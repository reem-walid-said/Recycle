import 'package:flutter/material.dart';
import 'package:project/core/assets.dart';
import 'package:project/models/store_category.dart';
import 'package:project/models/store_item.dart';

class StoreState{
  List<StoreCategory> storeCategories = [
    StoreCategory(name: "Water", assetsIcon: Assets.waterStoreIcon),
    StoreCategory(name: "Electricity", assetsIcon: Assets.electricityStoreIcon),
    StoreCategory(name: "Gas", assetsIcon: Assets.gasStoreIcon),
  ];

  List<StoreItem> storeItems = [
    StoreItem(name: "North Cairo Electricity", category: "Electricity"),
    StoreItem(name: "South Cairo Electricity", category: "Electricity"),
    StoreItem(name: "South Delta Electricity", category: "Electricity"),
    StoreItem(name: "Canal Electricity", category: "Electricity"),
    StoreItem(name: "Petro Trade", category: "Gas"),
    StoreItem(name: "Nat Gas", category: "Gas"),
    StoreItem(name: "Taqa Gas", category: "Gas"),
    StoreItem(name: "Cairo Water", category: "Water"),
    StoreItem(name: "Alexandria Water", category: "Water"),
  ];

  StoreCategory? selectedCategory;
  String selectedItem = "No Item Selected";
  bool isItemSelected = false;
  TextEditingController enteredPoints = TextEditingController();




}