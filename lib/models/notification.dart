import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel{
  String id;
  String title;
  String body;
  bool read;
  bool rated;
  Timestamp timestamp;
  String wid;
  String recycleProcessId;

  NotificationModel({

    required this.id,
    required this.timestamp,
    required this.body,
    required this.read,
    required this.rated,
    required this.title,
    required this.wid,
    required this.recycleProcessId,
});

  static NotificationModel fromJson(DocumentSnapshot snapshot) => NotificationModel(
      id: snapshot.get("id"),
      timestamp: snapshot.get("timestamp"),
      body: snapshot.get("body"),
      read: snapshot.get("read"),
      rated: snapshot.get("rated"),
      title: snapshot.get("title"),
      wid: snapshot.get("W-ID"),
      recycleProcessId: snapshot.get("RP-ID"),
  );

}