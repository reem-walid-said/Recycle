// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class Forget_U extends StatefulWidget {
  const Forget_U({super.key});

  @override
  State<Forget_U> createState() => _Forget_UState();
}

class _Forget_UState extends State<Forget_U> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Iconsax.arrow_left)),
                  Text("Forget Password ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.user,
                    scale: 4,
                  )
                ],
              ),
              Divider(
                height: 6.h,
                color: Colors.transparent,
              ),
              Text("Password Recovery",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text("Please Enter Your Email",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 40, 40, 40))),
              Text("To Retype Your Password",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 40, 40, 40))),
              Divider(
                height: 5.h,
                color: Colors.transparent,
              ),
              // Email field
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sms),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 95.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color(0xff649014).withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
