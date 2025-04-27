import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../services/local/notifications.dart' show NotificationService;

class NotificationDemoScreen extends StatefulWidget {
  @override
  _NotificationDemoScreenState createState() => _NotificationDemoScreenState();
}

class _NotificationDemoScreenState extends State<NotificationDemoScreen> {
  final NotificationService _notificationService = NotificationService();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestNotificationPermissions();
    _notificationService.initNotifications();
    _notificationService.listenForNotifications('papj72q6QUM2brm3qFWNflzbmD93'); // Replace with actual user ID
  }

  Future<void> _requestNotificationPermissions() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: 'Recipient User ID'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            ElevatedButton(
              onPressed: () async {
                // await _notificationService.sendNotification(
                //   recipientUserId: _userIdController.text,
                //   title: _titleController.text,
                //   body: _bodyController.text,
                //);
              },
              child: Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}