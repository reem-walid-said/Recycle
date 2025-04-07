// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:project/core/enum.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/categories/categories_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/home%20main/home_u_main.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/map/map.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/profile/profile_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/recycling%20process/recycling_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/scan/scan_u.dart';

import 'homestate.dart';

class HomeProvider_U extends ChangeNotifier {
  void init() {
    notifyListeners();
  }

  // ignore: unused_field
  final HomeState_U state = HomeState_U();

  void onNavigationTap(int value) {
    switch (value) {
      case 0:
        state.chosenNavigationItem = ParentsChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem =
            ParentsChosenNavigationItem.map;
        break;
      case 2:
        state.chosenNavigationItem = ParentsChosenNavigationItem.recycling_process;
        break;
      case 3:
        state.chosenNavigationItem = ParentsChosenNavigationItem.categories;
        break;
      case 4:
        state.chosenNavigationItem = ParentsChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  Widget chosenPage() {
    switch (state.chosenNavigationItem) {
      case ParentsChosenNavigationItem.home:
        return Home_U_Main();
      case ParentsChosenNavigationItem.map:
        return MapScreen();
      case ParentsChosenNavigationItem.recycling_process:
        return Recycling_U();

      case ParentsChosenNavigationItem.categories:
        return Categories_U();
      case ParentsChosenNavigationItem.profile:
        return Profile_U();

    }
  }

  void returnHome() {
    state.chosenNavigationItem = ParentsChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }
}
