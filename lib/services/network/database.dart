import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String id;
  DatabaseServices({required this.id});

  final CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Costumer");
  final CollectionReference EmployeeCollection =
      FirebaseFirestore.instance.collection("Employee");
  final CollectionReference WarehouseCollection =
      FirebaseFirestore.instance.collection("warehouses");

  Future createUser({
    required username,
    required email,
    required phone,
    address,
  }) async {
    return await UserCollection.doc(id).set({
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'points': 0,
      'address': address,
    });
  }

  Future getUserData() async {
    DocumentSnapshot document = await UserCollection.doc(id).get();
    if(document.exists){
      return document;
    }
  }

  Future updateUserPoints({
    required int points,
}) async {
    try{
      await UserCollection.doc(id).update({
        "points": FieldValue.increment(points),
      });
    }
    catch(e){
      print(e);
      return false;
    }
  }

  Future createEmployee() async {}

  ///ToDo
  ///{
  ///   CreateEmployee()
  ///   GetEmployeeData()
  ///   UpdateUserData()
  ///   UpdateEmployeeData()
  ///
  ///}
}
