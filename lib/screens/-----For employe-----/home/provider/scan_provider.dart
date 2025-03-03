import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_state.dart';
import 'package:project/services/network/database.dart';

import '../../../../models/user.dart';

class ScanProvider extends ChangeNotifier{
  ScanStates state = ScanStates();

  void onCategoryChange(newCategory){
    state.selectedCategory = newCategory;
    notifyListeners();
  }

  void onNumberIncrease(){
    if(state.selectedNumber == 100)return;
    state.selectedNumber++;

    notifyListeners();
  }
  void onNumberDecrease(){
    if(state.selectedNumber == 0)return;
    state.selectedNumber--;

    notifyListeners();
  }

  void onAddingItem(){
    print(state.itemNameController.text);
    print(state.selectedCategory?.type);
    print(state.selectedCategory?.points);
    print(state.selectedNumber);
    print(state.dropDownMenuController.text);

    if(state.itemNameController.text.isEmpty || state.selectedCategory == null || state.selectedNumber == 0){
      print("Invalid");
      myToast(
        message: "Invalid Data",
        backgroundColor: Colors.red,
      );
      return;
    }

    state.myScannedItem.add(RecycleItem(
        name: state.itemNameController.text,
        category: state.selectedCategory!,
        count: state.selectedNumber,
        totalPoints: state.selectedNumber * state.selectedCategory!.points,)
    );
    state.totalScannedItemsPoints += state.selectedNumber * state.selectedCategory!.points;

    if(state.selectedCategory?.type == "Plastic"){
      state.totalScannedPlasticItems += state.selectedNumber;
    }
    if(state.selectedCategory?.type == "Can"){
      state.totalScannedCanItems += state.selectedNumber;
    }
    if(state.selectedCategory?.type == "Glass"){
      state.totalScannedGlassItems += state.selectedNumber;
    }

    myToast(
      message: "Item Scanned Successfully",
      backgroundColor: Colors.green,
    );

    ResetAfterAdd();

    notifyListeners();
  }


  void onDeleteItem(RecycleItem item){
    state.myScannedItem.remove(item);
    state.totalScannedItemsPoints -= item.totalPoints;

    if(item.category.type == "Plastic"){
      state.totalScannedPlasticItems -= item.count;
    }
    if(item.category.type == "Can"){
      state.totalScannedCanItems -= item.count;
    }
    if(item.category.type == "Glass"){
      state.totalScannedGlassItems -= item.count;
    }

    notifyListeners();
  }

  void ResetAfterAdd(){
    state.selectedCategory = null;
    state.selectedNumber = 0;
    state.itemNameController.text = "";
    state.dropDownMenuController.text = "";

    notifyListeners();
  }

  void ResetAfterConfirm(){
    state.myScannedItem.clear();
    state.totalScannedItemsPoints = 0;
    state.selectedCategory = null;
    state.selectedNumber = 0;
    state.itemNameController.text = "";
    state.onConfirming = false;
    state.totalScannedGlassItems = 0;
    state.totalScannedCanItems = 0;
    state.totalScannedPlasticItems = 0;
    state.scannedUser = null;
    state.scannedId = null;

    notifyListeners();
  }



  Future onConfirmOrder({
    required String employeeId,
}) async {

    state.onConfirming = true;
    notifyListeners();

    try{
      await DatabaseServices(id: employeeId).updateUserPoints(points: state.totalScannedItemsPoints, userId: state.scannedUser!.id);
      await DatabaseServices(id: employeeId).addRecyclingProcess(
        uid: state.scannedUser!.id,
        username: state.scannedUser!.username,
        points: state.totalScannedItemsPoints,
        amount: {
          "plastic": state.totalScannedPlasticItems,
          "can": state.totalScannedCanItems,
          "glass": state.totalScannedGlassItems,
        }
      );

      await myToast(
        message: "Order has Confirmed",
        backgroundColor: Colors.green,
      );


    }catch(e){
      print(e);
    }
    ResetAfterAdd();
    ResetAfterConfirm();
    state.onConfirming = false;
    notifyListeners();
  }

  void ResetScannedId(){
    state.scannedId = null;
    state.cameraController.stop();
    state.cameraController.start();
    notifyListeners();
  }

  Future onScanID(scannedId) async {
    state.cameraController.stop(); // Stop the Camera
    state.scannedId = scannedId;

    dynamic result = await DatabaseServices(id: scannedId).getUserData();
    if(result == null) return false;

    state.scannedUser = User.fromJson(result);

    //state.cameraController.start(); // Start the Camera
    notifyListeners();
  }

  void onConfirmScan(){
    state.cameraController.start();
    notifyListeners();
  }
}