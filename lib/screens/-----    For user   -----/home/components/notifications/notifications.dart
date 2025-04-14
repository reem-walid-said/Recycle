import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:project/core/Assets.dart';

class Notifications_U extends StatelessWidget {
  final RemoteMessage message;
  const Notifications_U({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        actions: [
          Image.asset(Assets.logo)
        ],
      ),
      body: Center(child: Text("No Notifications")),
    );
  }
}
