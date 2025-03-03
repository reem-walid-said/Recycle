// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/provider/onbprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OnBourding_2 extends StatelessWidget {
  const OnBourding_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            App_Routes.chooseuser,
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: Color(0xff649014),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Image.asset(
                    Assets.onb2,
                    scale: 0.6.sp,
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Text(
                    "Recycle In Different Warehouses",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),

                  Divider(
                    height: 3.h,
                    color: Colors.transparent,
                  ),
                  Text(
                      "Find Nearby Recycling Warehouses With Ease.\nExplore Locations, Working Hours, And Accepted Materials To Ensure Hassle-Free Recycling.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                    maxLines: null,
                  ),
                  // Container(
                  //   width: 90.w,
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         "",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18.sp,
                  //             fontWeight: FontWeight.w300),
                  //       ),
                  //       Row(
                  //         children: [
                  //           VerticalDivider(
                  //             width: 4.w,
                  //           ),
                  //           Text(
                  //             "",
                  //             style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 17.sp,
                  //                 fontWeight: FontWeight.w300),
                  //           )
                  //         ],
                  //       ),
                  //       Text(
                  //         "",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 17.sp,
                  //             fontWeight: FontWeight.w300),
                  //       ),
                  //       Text(
                  //         "",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18.sp,
                  //             fontWeight: FontWeight.w300),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            // إضافة الدائرة في الزاوية اليمنى السفلية
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  context.read<onbprovider>().state.pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: CustomPaint(
                  size: const Size(100, 100), // الحجم الكلي للرسم
                  painter: QuarterArcPainter(),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward, // رمز السهم
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuarterArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // مركز اللوحة
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // نصف قطر الدائرة الرئيسية
    final double mainCircleRadius = size.width / 3;

    // الفرشاة لرسم الدائرة الرئيسية
    final Paint circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // رسم الدائرة الخضراء الرئيسية
    canvas.drawCircle(Offset(centerX, centerY), mainCircleRadius, circlePaint);

    // الفرشاة لرسم القوس
    final Paint arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    // إعداد مستطيل لرسم القوس
    final Rect arcRect = Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: mainCircleRadius + 5, // تحديد نصف القطر الخارجي للقوس
    );

    // رسم القوس (من المنتصف إلى الربع)
    canvas.drawArc(
      arcRect,
      -1.57, // الزاوية الابتدائية: -90 درجة (المنتصف الأعلى)
      3.3, // زاوية القوس: 90 درجة (الربع)
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
