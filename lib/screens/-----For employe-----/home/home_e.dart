import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----For%20employe-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';

import '../../-----    For user   -----/home/provider/user_provider.dart';
import '../../../services/local/notifications.dart';

class Home_E extends StatefulWidget {
  const Home_E({super.key});

  @override
  State<Home_E> createState() => _Home_EState();
}

class _Home_EState extends State<Home_E> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_E>().chosenPage(),
        bottomNavigationBar: const BottomNavBar_E()
    );
  }
}
