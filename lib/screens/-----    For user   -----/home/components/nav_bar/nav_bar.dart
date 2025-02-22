import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar_U extends StatefulWidget {
  const BottomNavBar_U({super.key});

  @override
  State<BottomNavBar_U> createState() => _BottomNavBar_U();
}

class _BottomNavBar_U extends State<BottomNavBar_U> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<HomeProvider_U>().chosenPage(),
      floatingActionButton: Container(
        height: 65, // Adjust height as needed
        width: 65, // Adjust width as needed
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, App_Routes.scan_U);
          },
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Rounded rectangle
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              Icon(Icons.qr_code_scanner, size: 24, color: Colors.white),
              SizedBox(height: 4), // Space between icon and text
              Text(
                "Scan",
                style: TextStyle(
                    fontSize: 12, color: Colors.white), // Adjust size and color
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedFontSize: 9.5,
        unselectedFontSize: 9.5,
        selectedIconTheme: IconThemeData(color: Colors.green),
        selectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        enableFeedback: false,
        backgroundColor: Colors.white,
        currentIndex: _currIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.home4),
              activeIcon: Icon(Iconsax.home_15),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt),
              activeIcon: Icon(Icons.sync_alt),
              label: "Recycling Process"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.category),
              activeIcon: Icon(Iconsax.category),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.frame_1),
              activeIcon: Icon(Iconsax.frame5),
              label: "Profile")
        ],
        onTap: (value) {
          setState(() {
            _currIndex = value;
            context.read<HomeProvider_U>().onNavigationTap(value);
          });
        },
      ),
    );
  }
}
