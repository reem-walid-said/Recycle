import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String id;
  DatabaseServices({required this.id});

  final CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Costumer");
  final CollectionReference EmployeeCollection =
      FirebaseFirestore.instance.collection("employees");
  final CollectionReference WarehouseCollection =
      FirebaseFirestore.instance.collection("warehouses");
  final CollectionReference RecycleProcessCollection =
      FirebaseFirestore.instance.collection("recycle_process");
  final CollectionReference ScannedItemsCount =
      FirebaseFirestore.instance.collection("ScannedItemsCount");

  Future createUser({
    required username,
    required email,
    required phone,
    address,
  }) async {

    QuerySnapshot querySnapshot = await UserCollection.get();
    int numberOfDocs = querySnapshot.docs.length;

    String localID = "U-${(numberOfDocs + 1).toString().padLeft(3, '0')}";

    return await UserCollection.doc(id).set({
      'globalID': id,
      'localID': localID,
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

  Future getUserRecycleResults(String localID) async {
    QuerySnapshot document = await RecycleProcessCollection.where("uid", isEqualTo: localID).get();
    print(document.docs);
    dynamic result = {
      "can" : 0,
      "plastic" : 0,
      "glass" : 0,
    };
    for(var doc in document.docs){
      print(doc.get("amount"));
      result["can"] += doc.get("amount")["can"];
      result["plastic"] += doc.get("amount")["plastic"];
      result["glass"] += doc.get("amount")["glass"];
    }

    print("Result : $result");

    return result;
  }

  Future updateUserPoints({
    required String userId,
    required int points,
}) async {
    try{
      await UserCollection.doc(userId).update({
        "points": FieldValue.increment(points),
      });
    }
    catch(e){
      print(e);
      return false;
    }
  }

  Future addRecyclingProcess({
    required String uid,
    required String username,
    required int points,
    required Map<String, dynamic> amount,
    String status = "Done",
}) async {
    try{
      //Getting the last document
      QuerySnapshot querySnapshot = await RecycleProcessCollection.get();
      int numberOfDocs = querySnapshot.docs.length;

      String newID = "RP-${(numberOfDocs + 1).toString().padLeft(3, '0')}";

      Map<String, dynamic> data = {
        'id' : newID,
        'uid': uid,
        'username': username,
        'eid': id,
        'points': points,
        'amount': amount,
        'status': status,
        'DateTime': DateTime.now(),
      };

      // Adding a new Recycle process
      await RecycleProcessCollection.doc(newID).set(data);

      // Updating the count for all scanned items
      await ScannedItemsCount.doc("plastic").update({
        "count": FieldValue.increment(amount["plastic"]),
      });
      await ScannedItemsCount.doc("can").update({
        "count": FieldValue.increment(amount["can"]),
      });
      await ScannedItemsCount.doc("glass").update({
        "count": FieldValue.increment(amount["glass"]),
      });

      return true;
    }catch(e){
      print(e);
      return false;
    }
  }


  Future getEmployeeData() async {
    DocumentSnapshot document = await EmployeeCollection.doc(id).get();
    if(document.exists){
      return document;
    }
  }

  ///ToDo
  ///{
  ///   UpdateUserData()
  ///   UpdateEmployeeData()
  ///}
}
