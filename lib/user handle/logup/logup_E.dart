// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/assets.dart';
import 'package:project/user%20handle/login/login_E.dart';
import 'package:project/user%20handle/login/singin_U.dart';
import 'package:sizer/sizer.dart';

class logup_E extends StatefulWidget {
  const logup_E({super.key});

  @override
  State<logup_E> createState() => login_E();
}

class login_E extends State<logup_E> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign Up'),
      //   backgroundColor: Colors.green,
      // ),
      body: SingleChildScrollView(
        // إضافة SingleChildScrollView لتفعيل التمرير
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
                  Text("Sign up ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.employee,
                    scale: 4,
                  )
                ],
              ),
              SizedBox(height: 20),
              // Name field
              Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Email field
              Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sms),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Number field
              Text(
                'Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password field
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
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Confirm Password field
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.lock),
                  suffixIcon: Icon(Iconsax.eye_slash),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Agree to terms checkbox
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text('I Agree To The '),
                  GestureDetector(
                    onTap: () {
                      // Open Terms and Conditions page
                    },
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Container(
                width: 90.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color(0xff649014),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // OR divider
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
              SizedBox(height: 20),
              // Sign up with Google button
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
                      Text("Sign up with Google ")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Already have an account?
            ],
          ),
        ),
      ),
    );
  }
}
