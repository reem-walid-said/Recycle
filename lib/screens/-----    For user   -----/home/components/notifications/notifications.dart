import 'package:flutter/material.dart';
import 'package:project/core/Assets.dart';

class Notifications_U extends StatelessWidget {
  const Notifications_U({super.key});

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
