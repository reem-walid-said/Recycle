import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/models/employee.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_state.dart';
import 'package:project/services/network/authentication.dart';
import 'package:project/services/network/database.dart';

import '../../../../models/user.dart';

class UserProvider extends ChangeNotifier{
  UserStates state = UserStates();

  Future GetUserData({
    id,
}) async {
    dynamic result = await DatabaseServices(id: id).getUserData();
    print(result);
    if(result is DocumentSnapshot){
      print("User Found");
      state.myUser = User.fromJson(result);
      print("User Stored");
      notifyListeners();
      return true;
    }
    else{
      state.myUser = null;
      print("User not found");
      notifyListeners();
      return false;
    }
  }

  Future GetEmployeeData({
    id,
  }) async {
    dynamic result = await DatabaseServices(id: id).getEmployeeData();
    print(result);
    if(result is DocumentSnapshot){
      print("User Found");
      state.myUser = Employee.fromJson(result);
      print("User Stored");
      notifyListeners();
      return true;
    }
    else{
      state.myUser = null;
      print("User not found");
      notifyListeners();
      return false;
    }
  }

  Future LogOut() async {
    state.myUser = null;
    ///Todo
    ///clear the caches
    await AuthServices().signOut();
  }

}