import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/login_U.dart';
import 'package:project/screens/-----For%20All%20Users-----/choose%20user/chooseuser.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/Assets.dart';

class CheckYourEmail extends StatelessWidget {
  const CheckYourEmail({super.key});

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
                  Text("Email  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.user,
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
              Text("Check Your Email",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text("We have sent a link to your email",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 40, 40, 40))),
              Divider(
                height: 5.h,
                color: Colors.transparent,
              ),

              // myElevatedButton(label: "Resend", onPressed: (){}),

              SizedBox(height: 20),
              Text("Didn't Receive any email? check your spam filter",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.grey[600]),
              ),

              Text("Or",
                style: TextStyle(
                    fontSize: 17.sp,
                    ),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Try Another Email", style: TextStyle(
                  fontSize: 17.sp, ),)),
              
              SizedBox(height: 50),

              myElevatedButton(label: "Back to Login", onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ChooseUser()), (route) => false);
              }),

            ],
          ),
        ),
      ),
    );
  }
}
