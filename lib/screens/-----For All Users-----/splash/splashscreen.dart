// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:project/services/local/cache_helper.dart';
import 'package:provider/provider.dart';
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

    String? id = CacheHelper.GetID();
    bool? firstTime = CacheHelper.firstTimeInstall();
    String? userType = CacheHelper.getUserType();

    print(id);
    print(firstTime);
    print(userType);

    if(firstTime == null){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(App_Routes.onboardingmain, (route) => false);
    }
    else{
      if(id == null){
        Navigator.of(context)
            .pushNamedAndRemoveUntil(App_Routes.chooseuser, (route) => false);
      }
      else{
        if(userType == "user"){
          await context.read<UserProvider>().GetUserData(id: id);
          context.read<HomeProvider_U>().returnHome();
          Navigator.pushNamedAndRemoveUntil(
            context,
            App_Routes.home_U,
                (route) => false,
          );
        }
        else{
          await context.read<UserProvider>().GetEmployeeData(id: id);
          context.read<HomeProvider_E>().returnHome();
          Navigator.pushNamedAndRemoveUntil(
            context,
            App_Routes.home_E,
                (route) => false,
          );
        }
      }
    }
  }
}
