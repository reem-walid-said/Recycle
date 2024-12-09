// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/provider/forget_E_provider.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Forget_E extends StatefulWidget {
  const Forget_E({super.key});

  @override
  State<Forget_E> createState() => _Forget_EState();
}

class _Forget_EState extends State<Forget_E> {
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
                  Text("Forget Password  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.employee,
                    scale: 4,
                  )
                ],
              ),
              Divider(
                height: 3.h,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.logo, scale: 5.sp),
                ],
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
              Container(
                padding: EdgeInsets.all(1.w),
                margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 3.sp, color: Colors.grey)),
                child: TextField(
                  controller: context
                      .read<ForgetPass_E_provider>()
                      .state
                      .forgetpasswordController,
                  style: TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Iconsax.sms,
                    ),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, App_Routes.codepage_E);
                },
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
