import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart' show AuthorizationStatus, FirebaseMessaging, NotificationSettings;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/core/components.dart';

import '../../core/constants.dart';

class NotificationService {

  NotificationService._privateConstructor();
  static final NotificationService _instance = NotificationService._privateConstructor();
  factory NotificationService() {
    return _instance;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  StreamSubscription<QuerySnapshot>? notificationListener;

  // Initialize notifications
  Future<void> initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  Future<void> requestNotificationPermissions(context) async {
    // Request permissions
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Check if granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Notifications enabled");
    } else {
      print("Notifications disabled");
      // Optionally show a message to the user

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enable notifications in settings")),
      );
    }
  }

  // Show a local notification
  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      NotificationConstants.channelId,  // channel_id
      NotificationConstants.channelName,     // channel_name
      importance: Importance.max,
      priority: Priority.high,
      channelDescription: NotificationConstants.channelDescription,
      enableVibration: true,
      playSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformDetails,
    );
  }

  // Send a notification via Firestore
  Future<void> sendNotification({
    required String recipientUserId,
    required String title,
    required String body,
    String warehouseId = "W-001",
  }) async {
    final docRef = await FirebaseFirestore.instance
        .collection('Costumer')
        .doc(recipientUserId)
        .collection('notifications')
        .add({
      'title': title,
      'body': body,
      'timestamp': FieldValue.serverTimestamp(),
      'read': false,
      'rated': false,
      'W-ID': warehouseId,
    });

    // Update the same document with its generated ID
    await docRef.update({
      'id': docRef.id,
    });
  }

  // Listen for incoming notifications
  void listenForNotifications(String userId) {
    // Always cancel any existing listener first
    notificationListener?.cancel();

    print("Listening on: $userId");
    notificationListener = FirebaseFirestore.instance
        .collection('Costumer')
        .doc(userId)
        .collection('notifications')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        if (!doc['read']) {
          showNotification(doc['title'], doc['body']);
          doc.reference.update({'read': true});
        }
      }
    });
  }

  // Call this when logging out
  void cancelNotificationListener() {
    notificationListener?.cancel();
    notificationListener = null;
    print("Notification listener canceled");
  }


}