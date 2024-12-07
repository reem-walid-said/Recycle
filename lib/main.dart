import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/user%20handle/onbourding/provider/onbprovider.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
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
          ChangeNotifierProvider(create: (_) => onbprovider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: App_Routes.splash,
          theme: ThemeData.light(),
          onGenerateRoute: App_Routes.onGenerateRoute,
        ),
      );
    });
  }
}
