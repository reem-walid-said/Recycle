// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Scaffold(
        body: Container(
      height: 100.h,
      width: 100.w,
      color: Colors.white,
      child: Center(
        child: Image.asset(Assets.logo1),
      ),
    ));
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(App_Routes.onboardingmain, (route) => false);
  }
}
