// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/user%20handle/onbourding/components/onb1.dart';
import 'package:project/user%20handle/onbourding/components/onb2.dart';
import 'package:project/user%20handle/onbourding/components/onb3.dart';
import 'package:project/user%20handle/onbourding/components/onb4.dart';
import 'package:project/user%20handle/onbourding/provider/onbprovider.dart';
import 'package:provider/provider.dart';

class OnBourding extends StatelessWidget {
  OnBourding({super.key});
  List<Widget> pages = [
    OnBourding_1(),
    OnBourding_2(),
    OnBourding_3(),
    OnBourding_4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: context.read<onbprovider>().state.pageController,
            children: pages,
          ))
        ],
      ),
    );
  }
}
