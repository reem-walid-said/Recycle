import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class Congrats_E extends StatefulWidget {
  const Congrats_E({super.key});

  @override
  State<Congrats_E> createState() => _Congrats_EState();
}

class _Congrats_EState extends State<Congrats_E> {
  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Divider(
          height: 20.h,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("congratiolations!",
                style: TextStyle(
                    fontSize: 23.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have been signed in ",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("successfuly",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Divider(
          height: 5.h,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.congrats, scale: 5.5.sp),
          ],
        ),
      ]),
    ));
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(App_Routes.login_E, (route) => false);
  }
}
