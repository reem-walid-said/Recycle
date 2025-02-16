import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_state.dart';

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
    if(state.selectedNumber == 1)return;
    state.selectedNumber--;

    notifyListeners();
  }

  void onAddingItem(){
    print(state.itemNameController.text);
    print(state.selectedCategory?.type);
    print(state.selectedCategory?.points);
    print(state.selectedNumber);

    if(state.itemNameController.text.isEmpty || state.selectedCategory == null){
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

    myToast(
      message: "Item Scanned Successfully",
      backgroundColor: Colors.green,
    );

    notifyListeners();
  }


  void onDeleteItem(RecycleItem item){
    state.myScannedItem.remove(item);
    state.totalScannedItemsPoints -= item.totalPoints;
    notifyListeners();
  }

  void Reset(){
    state.myScannedItem.clear();
    state.totalScannedItemsPoints = 0;
    state.selectedCategory = null;
    state.selectedNumber = 1;
    state.itemNameController.text = "";

    notifyListeners();
  }

  void onConfirmOrder(){
    myToast(
      message: "Order has Confirmed",
      backgroundColor: Colors.green,
    );
    Reset();
    notifyListeners();
  }
}