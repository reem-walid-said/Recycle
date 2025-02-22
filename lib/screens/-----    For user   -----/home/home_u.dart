import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class Home_U extends StatelessWidget {
  const Home_U({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_U>().chosenPage(),
        bottomNavigationBar: const BottomNavBar_U());
  }
}
