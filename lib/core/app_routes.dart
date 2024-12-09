// ignore_for_file: constant_identifier_names, camel_case_types, duplicate_import, type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/scan/scan_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/home_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/components/code_U.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/components/congrats_U.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/components/newpass_U.dart';
import 'package:project/screens/-----For%20All%20Users-----/splash/splashscreen.dart';
import 'package:project/screens/-----For%20All%20Users-----/choose%20user/chooseuser.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/components/code_E.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/components/congrats_E.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/components/newpass_E.dart';

import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/forget_E.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/forget_U.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/login/login_E.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/login_U.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/register/register_E.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/register/register_U.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/components/onb1.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/components/onb2.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/components/onb3.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/onbmain.dart';

class App_Routes {
  /////////////////////////For all users///////////////////////

  static const String splash = "/";
  static const String onboardingmain = "onbourdingmain";
  static const String onb1 = "onb1";
  static const String onb2 = "onb2";
  static const String onb3 = "onb3";
  static const String chooseuser = "chooseuser";

  /////////////////////////For  users///////////////////////

  static const String login_U = "login_U";
  static const String register_U = "register_U";
  static const String forget_U = "forget_U";
  static const String codepage_U = "codepage_U";
  static const String createpassword_U = "createpassword_U";
  static const String congrats_U = "congrats_U";
  static const String home_u = "home_u";
  static const String scan_u = "scan_u";

  /////////////////////////For  Employes///////////////////////

  static const String login_E = "login_E";
  static const String register_E = "register_E";
  static const String forget_E = "forget_E";
  static const String codepage_E = "codepage_E";
  static const String createpassword_E = "createpassword_E";
  static const String congrats_E = "congrats_E";

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
      case login_U:
        return MaterialPageRoute(
          builder: (context) {
            return const Login_U();
          },
        );

      case register_E:
        return MaterialPageRoute(
          builder: (context) {
            return const Register_E();
          },
        );
      case register_U:
        return MaterialPageRoute(
          builder: (context) {
            return const Register_U();
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
      case codepage_E:
        return MaterialPageRoute(
          builder: (context) {
            return CodePage_E();
          },
        );
      case createpassword_E:
        return MaterialPageRoute(
          builder: (context) {
            return CreatePassword_E();
          },
        );
      case congrats_E:
        return MaterialPageRoute(
          builder: (context) {
            return Congrats_E();
          },
        );
      case codepage_U:
        return MaterialPageRoute(
          builder: (context) {
            return CodePage_U();
          },
        );
      case createpassword_U:
        return MaterialPageRoute(
          builder: (context) {
            return CreatePassword_U();
          },
        );
      case congrats_U:
        return MaterialPageRoute(
          builder: (context) {
            return Congrats_U();
          },
        );
      case home_u:
        return MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        );
      case scan_u:
        return MaterialPageRoute(
          builder: (context) {
            return Scan_U();
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
