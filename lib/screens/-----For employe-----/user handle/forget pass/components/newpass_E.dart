// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/Assets.dart';

//
class CreatePassword_E extends StatelessWidget {
  const CreatePassword_E({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Iconsax.arrow_left)),
            Text("Reset Password",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp)),
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
                    Text("Reset Your Password",
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
                      "Please enter your new password",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: " New Password",
                      prefixIcon: const Icon(Iconsax.lock),
                      suffixIcon: const Icon(Iconsax.eye),
                      hintStyle: const TextStyle(
                          color: Color(0xff9CA3AF), fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Password must be at least 8 characters',
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: " Confirm Password",
                        prefixIcon: const Icon(Iconsax.lock),
                        suffixIcon: const Icon(Iconsax.eye),
                        hintStyle: const TextStyle(
                            color: Color(0xff9CA3AF), fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 5.h,
                  color: Colors.transparent,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(App_Routes.congrats_E);
                    },
                    child: Container(
                      height: 48,
                      width: 343,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff649014).withOpacity(0.25),
                      ),
                      child: const Center(
                        child: Text(
                          'Change',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    )));
  }
}
