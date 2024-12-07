// ignore_for_file: constant_identifier_names, camel_case_types, duplicate_import, type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:project/splash/splashscreen.dart';
import 'package:project/user%20handle/choose%20user/chooseuser.dart';
import 'package:project/user%20handle/forget%20pass/components/verifyemail.dart';
import 'package:project/user%20handle/forget%20pass/forget_E.dart';
import 'package:project/user%20handle/forget%20pass/forget_U.dart';
import 'package:project/user%20handle/login/login_E.dart';
import 'package:project/user%20handle/login/singin_U.dart';
import 'package:project/user%20handle/logup/logup_E.dart';
import 'package:project/user%20handle/logup/logup_U.dart';
import 'package:project/user%20handle/onbourding/components/onb1.dart';
import 'package:project/user%20handle/onbourding/components/onb2.dart';
import 'package:project/user%20handle/onbourding/components/onb3.dart';
import 'package:project/user%20handle/onbourding/onbmain.dart';

class App_Routes {
  static const String splash = "/";
  static const String onboardingmain = "onbourdingmain";
  static const String onb1 = "onb1";
  static const String onb2 = "onb2";
  static const String onb3 = "onb3";
  static const String login = "login";
  static const String chooseuser = "chooseuser";
  static const String login_E = "login_E";
  static const String Login_U = "login_U";
  static const String Logup_U = "logUP_U";
  static const String Logup_E = "logUP_E";
  static const String forget_U = "forget_U";
  static const String forget_E = "forget_E";
  static const String tVerifyPassPage_E = "tVerifyPassPage_E";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case onboardingmain:
        return MaterialPageRoute(
          builder: (context) {
            return OnBourding();
          },
        );
      case onb1:
        return MaterialPageRoute(
          builder: (context) {
            return OnBourding_1();
          },
        );
      case onb2:
        return MaterialPageRoute(
          builder: (context) {
            return OnBourding_2();
          },
        );
      case onb3:
        return MaterialPageRoute(
          builder: (context) {
            return OnBourding_3();
          },
        );
      case chooseuser:
        return MaterialPageRoute(
          builder: (context) {
            return ChooseUser();
          },
        );
      case login_E:
        return MaterialPageRoute(
          builder: (context) {
            return Login_E();
          },
        );
      case Login_U:
        return MaterialPageRoute(
          builder: (context) {
            return const login_U();
          },
        );

      case Logup_E:
        return MaterialPageRoute(
          builder: (context) {
            return const logup_E();
          },
        );
      case Logup_U:
        return MaterialPageRoute(
          builder: (context) {
            return const logup_U();
          },
        );
      case forget_U:
        return MaterialPageRoute(
          builder: (context) {
            return Forget_U();
          },
        );
      case forget_E:
        return MaterialPageRoute(
          builder: (context) {
            return Forget_E();
          },
        );
      case tVerifyPassPage_E:
        return MaterialPageRoute(
          builder: (context) {
            return TVerifyPassPage_E();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${setting.name}"),
              ),
            );
          },
        );
    }
  }
}
