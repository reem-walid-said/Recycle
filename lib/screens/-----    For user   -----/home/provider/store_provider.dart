import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/models/store_category.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/store_state.dart';
import 'package:project/services/local/notifications.dart';
import 'package:project/services/network/database.dart';

class StoreProvider extends ChangeNotifier{

  final StoreState state = StoreState();

  void changeCategory(StoreCategory newCategory){
    state.selectedCategory = newCategory;
    state.selectedItem = "No Item Selected";
    state.isItemSelected = false;
    notifyListeners();
  }

  void changeItem(String newItem){
    state.selectedItem = newItem;
    state.isItemSelected = true;
    notifyListeners();
  }

  Future requestStoreItem({
    required String userId,
    required int userPoints,
}) async {
    if(!state.isItemSelected){
      myToast(
        message: "You must select an item to request",
        timeInSec: 2,
      );
      return;
    }

    int requestedPoints = int.parse(state.enteredPoints.text);

    if(requestedPoints > userPoints){
      myToast(
        message: "You don't have enough points",
        timeInSec: 2,
      );
      return;
    }


    await DatabaseServices(id: userId).updateUserPoints(userId: userId, points: -requestedPoints);

    Random random = Random();
    int randomNumber = 1000 + random.nextInt(9000);
    print(randomNumber);
    await NotificationService().sendNotification(recipientUserId: userId, title: "Received Code", body: "You received payment code $randomNumber, valid for 30 minutes.");

    myToast(
      message: "Your Request Has Been Sent",
      backgroundColor: Colors.green,
    );

    notifyListeners();
    return true;
  }

}