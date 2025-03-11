import 'package:flutter/material.dart';
import 'package:project/core/components.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Welcome to [green Bin]! We value your privacy and are committed to protecting your data. This section explains how we handle your information when you use the app.",
                  style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20,),

              Text(
                "What Data Do We Collect?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Text(
                "When you use the app, we may collect certain data to improve your experience, including:",
                style: TextStyle(fontSize: 18),
              ),

              BulletListBuilder(
                  items: [
                    "Basic Information: Such as your name, email, and phone number when registering.",
                    "App Usage Data: Including the recyclable materials you contribute, the locations where you drop them off, and the rewards you earn.",
                    "Device Information: Such as your device type and operating system version to enhance app performance.",
                  ],
                fontSize: 18,
              ),

              SizedBox(height: 20,),

              Text(
                "How Do We Use Your Data?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Text(
                "We use your data to:",
                style: TextStyle(fontSize: 18),
              ),

              BulletListBuilder(
                items: [
                  "Improve user experience and provide better services.",
                  "Track recycled materials to ensure smooth operations.",
                  "Allocate rewards based on your contributions.",
                  "Communicate updates or technical issues with you.",
                ],
                fontSize: 18,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
