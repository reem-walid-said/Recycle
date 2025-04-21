import 'package:flutter/material.dart';
import 'package:project/core/Assets.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
        centerTitle: true,
        actions: [
          Image.asset(Assets.logo),
        ],
      ),
      body: Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No Items Available"),
            ],
          ),
        ),
      ),
    );
  }
}
