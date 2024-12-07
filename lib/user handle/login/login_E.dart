// ignore_for_file: file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/user%20handle/logup/logup_E.dart';
import 'package:project/user%20handle/logup/logup_U.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';

class Login_E extends StatefulWidget {
  const Login_E({super.key});

  @override
  State<Login_E> createState() => Login_EState();
}

class Login_EState extends State<Login_E> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //       child: Text("Sing In",
      //           style:
      //               TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp))),
      //   actions: [],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Iconsax.arrow_left)),
                    Text("Sign in ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20.sp)),
                    Image.asset(
                      Assets.employee,
                      scale: 4,
                    )
                  ],
                ),
                SizedBox(height: 30.sp), // مسافة بين الـ AppBar وأول عنصر
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.sms),
                    border: OutlineInputBorder().scale(3),
                  ),
                ),
                SizedBox(height: 25.sp),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.lock),
                    suffixIcon: Icon(Iconsax.eye_slash),
                    border: OutlineInputBorder().scale(3),
                  ),
                ),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, App_Routes.forget_E);
                      },
                      child: Text('Forget Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 90.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Color(0xff649014),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.sp),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 90.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VerticalDivider(
                          width: 25.w,
                          color: Colors.transparent,
                        ),
                        Image.asset(
                          Assets.google,
                          scale: 1,
                        ),
                        VerticalDivider(
                          width: 1.w,
                          color: Colors.transparent,
                        ),
                        Text("Sign in with Google ")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.sp),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't Have An Account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => logup_E(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
