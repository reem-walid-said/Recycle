import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/provider/forget_U_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/provider/login_U_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/register/provider/register_U_provder.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/model_provider.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/provider/forget_E_provider.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/login/provider/login_E_provider.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/register/provider/register_provder.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/screens/-----For%20All%20Users-----/onbourding/provider/onbprovider.dart';
import 'package:project/services/network/notifications.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'screens/-----For employe-----/home/provider/scan_provider.dart';
import 'screens/test_screen.dart';
import 'services/local/cache_helper.dart';

void main() async {
  // runApp(DevicePreview(
  //   builder: (context) => const MyApp(),
  //   enabled: true,
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => onbprovider()),
          ChangeNotifierProvider(create: (context) => Login_E_Provider()),
          ChangeNotifierProvider(create: (context) => CreateAccountProvider()),
          ChangeNotifierProvider(create: (context) => ForgetPass_E_provider()),
          ChangeNotifierProvider(create: (context) => CreateAccountProvider_U()),
          ChangeNotifierProvider(create: (context) => Login_U_Provider()),
          ChangeNotifierProvider(create: (context) => ForgetPass_U_provider()),
          ChangeNotifierProvider(create: (context) => HomeProvider_U()),
          ChangeNotifierProvider(create: (context) => HomeProvider_E()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => ScanProvider()),
          ChangeNotifierProvider(create: (context) => ModelProvider()),
        ],

        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: App_Routes.splash,
          theme: ThemeData.light(),
          onGenerateRoute: App_Routes.onGenerateRoute,
        ),

        // child: MaterialApp(
        //   home: NotificationDemoScreen(),
        // ),

      );
    });
  }
}
