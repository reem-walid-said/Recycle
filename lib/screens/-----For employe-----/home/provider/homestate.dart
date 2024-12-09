// ignore_for_file: non_constant_identifier_names

import 'package:project/core/enum.dart';

class HomeState_E {
  ParentsChosenNavigationItem chosenNavigationItem =
      ParentsChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
}
