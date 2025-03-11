import 'package:flutter/material.dart';
import 'package:project/screens/-----For%20All%20Users-----/privacy_policy/privacy_policy.dart';
import 'package:switcher_button/switcher_button.dart';

class Settings_E_Screen extends StatefulWidget {
  const Settings_E_Screen({super.key});

  @override
  State<Settings_E_Screen> createState() => _SettingsState();
}

class _SettingsState extends State<Settings_E_Screen> {
  bool notificationSwitcherValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.notifications_none_outlined, size: 30,),
                SizedBox(width: 5,),
                Text("Notifications", style: TextStyle(fontSize: 16),),
                Spacer(),
                SwitcherButton(
                  value: notificationSwitcherValue,
                  onChange: (value){
                    setState(() {
                      notificationSwitcherValue = value;
                    });
                  },
                  onColor: Colors.green,
                  offColor: Colors.white,
                  size: 60,
                ),
              ],
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
              },
              child: Row(
                children: [
                  Icon(Icons.privacy_tip_outlined, size: 30,),
                  SizedBox(width: 5,),
                  Text("Privacy Policy", style: TextStyle(fontSize: 16),),
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                  }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
