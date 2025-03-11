import 'package:cloud_firestore/cloud_firestore.dart';

class Employee{
  String globalID;
  String localID;
  String username;
  String email;
  String phone;
  String status;
  DateTime dateTime;
  String address;

  String? warehouseID;
  DateTime? departureTime;
  DateTime? attendanceTime;


  Employee({
    required this.globalID,
    required this.localID,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateTime,
    required this.status,

    this.warehouseID,
    this.attendanceTime,
    this.departureTime,
});

  static Employee fromJson(DocumentSnapshot snapshot) => Employee(
    globalID: snapshot.get("globalID"),
    localID: snapshot.get("id"),
    username: snapshot.get("name"),
    email: snapshot.get("email"),
    phone: snapshot.get("phone"),
    address: snapshot.get("address"),
    dateTime: snapshot.get("date").toDate(),
    status: snapshot.get("status"),
  );
}