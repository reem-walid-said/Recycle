import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class Home_U_Main extends StatefulWidget {
  const Home_U_Main({super.key});

  @override
  State<Home_U_Main> createState() => _Home_U_MainState();
}

class _Home_U_MainState extends State<Home_U_Main> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1.h, color: Colors.transparent),
                  Row(
                    children: [
                      Image.asset(
                        Assets.logo,
                        scale: 3,
                      ),
                      VerticalDivider(width: 2.w, color: Colors.transparent),
                      Text("Welcome,Reem ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                      Spacer(),
                      Icon(Iconsax.notification),
                    ],
                  ),
                  Divider(height: 3.h, color: Colors.transparent),
                  Row(
                    children: [
                      Text("End of Day Work",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Container(
                      height: 20.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.container_home),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("2:30:59",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.sp)),
                      )),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    children: [
                      Text("Transactions",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Attendance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp)),
                                ],
                              ),
                              Divider(
                                height: 5.h,
                                color: Colors.transparent,
                              ),
                              Text("29 Day",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Recycle Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp)),
                                ],
                              ),
                              Divider(
                                height: 5.h,
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("15 ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp)),
                                  VerticalDivider(
                                      width: 1.w, color: Colors.transparent),
                                  Image.asset(Assets.arrow, scale: 1),
                                  VerticalDivider(
                                      width: 1.w, color: Colors.transparent),
                                  Text("+1 ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                      Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 15.h,
                        width: 27.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff649014).withOpacity(0.25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Divider(height: 2.h, color: Colors.transparent),
                              Image.asset(Assets.bottle, scale: 1),
                              Divider(height: 1.h, color: Colors.transparent),
                              Text("Bottle",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 27.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff649014).withOpacity(0.25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Divider(height: 2.h, color: Colors.transparent),
                              Image.asset(Assets.can, scale: 1),
                              Divider(height: 1.h, color: Colors.transparent),
                              Text("Can",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 27.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff649014).withOpacity(0.25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Divider(height: 2.h, color: Colors.transparent),
                              Image.asset(Assets.bottle, scale: 1),
                              Divider(height: 1.h, color: Colors.transparent),
                              Text("Bottle",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
