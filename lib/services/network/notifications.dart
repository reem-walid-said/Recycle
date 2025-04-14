import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/notifications/notifications.dart';

class FirebaseNotifications{
  final firebaseMessaging = FirebaseMessaging.instance;


  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();

    String? token = await firebaseMessaging.getToken();

    print("Token: ${token}");

    handelBackgroundNotification();
  }

  void handelMessage(RemoteMessage? message){
    if(message == null) return;

    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => Notifications_U(message: message)));
  }


  Future handelBackgroundNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
  }
}