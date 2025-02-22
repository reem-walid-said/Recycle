import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String id;
  String username;
  String email;
  String phone;
  int points;

  String? address;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.points,

    this.address,
});

  static User fromJson(DocumentSnapshot snapshot) => User(
      id: snapshot.get("id"),
      username: snapshot.get("username"),
      email: snapshot.get("email"),
      phone: snapshot.get("phone"),
      points: snapshot.get("points"),
      address: snapshot.get("address"),
  );
}