import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class CodePage_E extends StatefulWidget {
  const CodePage_E({super.key});

  @override
  State<CodePage_E> createState() => _VerificationEmailRegister();
}

class _VerificationEmailRegister extends State<CodePage_E> {
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
                  Text("OTP",
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Divider(
                        height: 2.h,
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Password Recovery",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))
                        ],
                      ),
                      Divider(
                        height: 2.h,
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Check your email for the",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "verification code",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5.h,
                        color: Colors.transparent,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 8),
                        ///////////////// 6 degits//////////////////
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(1.w),
                              margin: EdgeInsets.only(bottom: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 4.sp,
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
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
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
                                    color: Colors.grey,
                                    width: 4.sp,
                                  )),
                              height: 6.h,
                              width: 11.w,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                                    color: Colors.grey,
                                    width: 4.sp,
                                  )),
                              height: 6.h,
                              width: 11.w,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                                    color: Colors.grey,
                                    width: 4.sp,
                                  )),
                              height: 6.h,
                              width: 11.w,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                                    color: Colors.grey,
                                    width: 4.sp,
                                  )),
                              height: 6.h,
                              width: 11.w,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                                    color: Colors.grey,
                                    width: 4.sp,
                                  )),
                              height: 6.h,
                              width: 11.w,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                          Text("Code Expire in :",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          Text(
                            timercount == 0 ? "0:46" : timercount.toString(),
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, bottom: 20, top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(App_Routes.createpassword_E);
                          },
                          child: Container(
                            height: 48,
                            width: 343,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff649014).withOpacity(0.25)),
                            child: const Center(
                              child: Text(
                                'Verify',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                          minWidth: 5.w,
                          onPressed: verfitimer,
                          child: Text(
                            "ReSend Code ",
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.7)),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
