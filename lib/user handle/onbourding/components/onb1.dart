// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/onbprovider.dart';

class OnBourding_1 extends StatelessWidget {
  OnBourding_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
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
                    Assets.onb1,
                    scale: 0.8.sp,
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Text(
                    "Scan Items",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    height: 3.h,
                    color: Colors.transparent,
                  ),
                  ////////المربع اللي فيه الكلام اخر حاجه تحت //////////
                  Container(
                    width: 90.w,
                    child: Column(
                      children: [
                        Text(
                          "Scan Items With Camera And Let AI",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Row(
                          children: [
                            VerticalDivider(
                              width: 4.w,
                            ),
                            Text(
                              "Identify Their Materials. Instantly Know",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Text(
                          "What Can Be Recycled. Making Eco-",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Row(
                          children: [
                            VerticalDivider(
                              width: 4.w,
                            ),
                            Text(
                              "Friendly Choices Has Never Been Easier!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
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
      1.57, // زاوية القوس: 90 درجة (الربع)
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
