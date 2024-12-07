// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class TVerifyPassPage_E extends StatefulWidget {
  const TVerifyPassPage_E({super.key});

  @override
  State<TVerifyPassPage_E> createState() => _VerificationEmailRegister();
}

class _VerificationEmailRegister extends State<TVerifyPassPage_E> {
  int timercount = 60;
  void verfitimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timercount > 0) {
        setState(() {
          timercount--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Image.asset(
                      //   Assets.colorhome,
                      //   fit: BoxFit.fill,
                      //   width: 100.w,
                      //   height: 22.h,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(
                                        Iconsax.arrow_left4,
                                        color: Colors.white,
                                      )),
                                  // Image.asset(
                                  //   Assets.logoonx2,
                                  //   height: 4.h,
                                  // )
                                ]),
                            Divider(
                              height: 1.h,
                              color: Colors.transparent,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Verify Your Email",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.05,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Please enter the 6 digit code sent to email",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  // color: AppColours.neutral500
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.h,
                            color: Colors.transparent,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, top: 8),
                            // 6 degits
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        // color: AppColours.neutral300,
                                        width: 1.sp,
                                      )),
                                  height: 6.h,
                                  width: 11.w,
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2.w,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                timercount == 0
                                    ? "0:45"
                                    : timercount.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  // color: AppColours.text
                                ),
                              ),
                              MaterialButton(
                                  minWidth: 5.w,
                                  onPressed: verfitimer,
                                  child: Text(
                                    "ReSend Code ",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      // color: AppColours.neutral500
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 20, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(App_Routes.login);
          },
          child: Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff2E3192),
            ),
            child: const Center(
              child: Text(
                'Verify',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
