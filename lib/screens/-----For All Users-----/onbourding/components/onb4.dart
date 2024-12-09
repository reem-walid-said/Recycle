// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace
// \n
import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/provider/onbprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OnBourding_4 extends StatelessWidget {
  const OnBourding_4({super.key});

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
                    Assets.onb4,
                    scale: 0.8.sp,
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Text(
                    "Transfer To Factories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    height: 3.h,
                    color: Colors.transparent,
                  ),
                  Container(
                    width: 90.w,
                    child: Column(
                      children: [
                        Text(
                          "Ensure Collected Materials Are",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Transported To Recycling Factories. Close",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "The Loop And Help Create A",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Sustainable Future.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300),
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    App_Routes.chooseuser,
                    (route) => false,
                  );
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
      6.3, // زاوية القوس: 90 درجة (الربع)
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
