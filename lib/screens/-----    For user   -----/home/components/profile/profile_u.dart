import 'package:flutter/material.dart';

class Profile_U extends StatefulWidget {
  const Profile_U({super.key});

  @override
  State<Profile_U> createState() => _Profile_UState();
}

class _Profile_UState extends State<Profile_U> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Profile_U'),
        ),
      ),
    );
  }
}
