import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/assets.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/homeprovider.dart';
import '../category_examples/category_examples.dart';

class Home_E_Main extends StatefulWidget {
  const Home_E_Main({super.key});

  @override
  State<Home_E_Main> createState() => _Home_E_MainState();
}

class _Home_E_MainState extends State<Home_E_Main> {
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
                      Text("Welcome, ${context.watch<UserProvider>().state.myUser.username}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                      Spacer(),
                      // Icon(Iconsax.notification),
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
                          color: Color(0xCCFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A808080),
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
                          color: Color(0xCCFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A808080),
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
                                  Text(" +1",
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
                      TextButton(
                        onPressed: (){
                          context.read<HomeProvider_E>().onNavigationTap(2);
                        },
                        child: Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Plastic")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 179, 0, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(
                                  Assets.bottle,
                                  scale: 1,
                                  color: Color.fromRGBO(255, 179, 0, 1),
                                ),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Plastic",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Can")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(0, 150, 136, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(
                                  Assets.can,
                                  scale: 1,
                                  color: Color.fromRGBO(0, 150, 136, 1),
                                ),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Can",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Glass")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(38, 70, 83, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(Assets.glass,
                                    scale: 1,
                                    color: Color.fromRGBO(38, 70, 83, 1)),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Glass",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
