import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String globalID;
  String localID;
  String username;
  String email;
  String phone;
  int points;

  String? address;

  int? canNumbers;
  int? plasticNumbers;
  int? glassNumbers;

  User({
    required this.globalID,
    required this.localID,
    required this.username,
    required this.email,
    required this.phone,
    required this.points,
    this.canNumbers,
    this.glassNumbers,
    this.plasticNumbers,

    this.address,
});

  static User fromJson(DocumentSnapshot snapshot, dynamic recycleResults) => User(
      globalID: snapshot.get("globalID"),
      localID: snapshot.get("localID"),
      username: snapshot.get("username"),
      email: snapshot.get("email"),
      phone: snapshot.get("phone"),
      points: snapshot.get("points"),
      address: snapshot.get("address"),

      canNumbers: recycleResults["can"],
      plasticNumbers: recycleResults["plastic"],
      glassNumbers: recycleResults["glass"],

  );
}