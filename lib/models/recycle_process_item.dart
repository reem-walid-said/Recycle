import 'package:cloud_firestore/cloud_firestore.dart';

class RecycleProcessItem{
  String id;
  String uid;
  String username;
  String eid;
  String? employeeName;
  Map<String, dynamic> amount;
  int points;
  DateTime dateTime;
  String status;

  RecycleProcessItem({
    required this.dateTime,
    required this.status,
    required this.points,
    required this.username,
    required this.uid,
    required this.id,
    required this.amount,
    required this.eid,
    this.employeeName,
});


  static RecycleProcessItem fromJson(DocumentSnapshot snapshot) => RecycleProcessItem(
      dateTime: snapshot.get("DateTime").toDate(),
      status: snapshot.get("status"),
      points: snapshot.get("points"),
      username: snapshot.get("username"),
      uid: snapshot.get("uid"),
      id: snapshot.get("id"),
      amount: snapshot.get("amount"),
      eid: snapshot.get("eid")
  );
}