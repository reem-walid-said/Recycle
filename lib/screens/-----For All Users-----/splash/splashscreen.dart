// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    handleData(context);
    GifController _controller = GifController(vsync: this);
    return Scaffold(
      body: Center(
        child: Gif(
          image: AssetImage(Assets.logo_gif),
          controller:
              _controller, // if duration and fps is null, original gif fps will be used.
          //fps: 30,
          //duration: const Duration(seconds: 3),
          autostart: Autostart.no,
          placeholder: (context) => const Text(''),
          onFetchCompleted: () {
            _controller.reset();
            _controller.forward();
          },
        ),
      ),
    );
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(App_Routes.onboardingmain, (route) => false);
  }
}
