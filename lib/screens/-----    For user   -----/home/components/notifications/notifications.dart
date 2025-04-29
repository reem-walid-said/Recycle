import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:project/core/Assets.dart';
import 'package:project/models/warehouse.dart';
import 'package:provider/provider.dart';

import '../../../../../core/components.dart';
import '../../../../../models/notification.dart';
import '../../provider/user_provider.dart';

class Notifications_U extends StatefulWidget {
  const Notifications_U({super.key});

  @override
  State<Notifications_U> createState() => _Notifications_UState();
}

class _Notifications_UState extends State<Notifications_U> {

  List<NotificationModel> myNotifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        actions: [
          Image.asset(Assets.logo)
        ],
      ),
      body: StreamBuilder(
          stream: myNotificationsStream(context.watch<UserProvider>().state.myUser.globalID),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            myNotifications = snapshot.data!.docs.map((e) => NotificationModel.fromJson(e as DocumentSnapshot<Object?>)).toList();

            if(myNotifications.isEmpty){
              return Center(child: Text("No Notifications"),);
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        if(myNotifications[index].rated == null || myNotifications[index].rated == true)return;
                        print("Dialog");
                        showRateDialog(context, myNotifications[index]);
                      },
                      child: NotificationBuilder(myNotifications[index])
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  itemCount: myNotifications.length
              ),
            );
          }
      ),
    );
  }

  Stream<QuerySnapshot> myNotificationsStream(String userId) {
    return FirebaseFirestore.instance
        .collection("Costumer")
        .doc(userId)
        .collection("notifications")
        .orderBy('timestamp', descending: true)
        .snapshots();
  }


  void showRateDialog(BuildContext context, NotificationModel notification) {
    showDialog(
      context: context,
      builder: (context) {
        return RateDialog(context, notification);
      },
    );
  }

  Widget RateDialog(context, NotificationModel notification) {
    double rating = 3;
    TextEditingController reviewController = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.white,
      title: Center(child: const Text("Rate Us")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("How would you rate your experience?"),
          const SizedBox(height: 15),
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
          ),
          SizedBox(height: 10,),
          TextField(
            controller: reviewController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Leave a comment (optional)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

        ],
      ),
      actions: [
        myElevatedButton(
            label: "Send",
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("Costumer")
                  .doc(Provider.of<UserProvider>(context, listen: false).state.myUser.globalID)
                  .collection("notifications")
                  .doc(notification.id)
                  .update({
                'rated' : true,
              });

              // Post the Review in the Warehouse -> Reviews Collection
              QuerySnapshot warehouseJson = await FirebaseFirestore.instance
                  .collection("warehouses")
                  .where("W-ID", isEqualTo: notification.wid)
                  .limit(1)
                  .get();
              
              DocumentReference warehouseRef = warehouseJson.docs.first.reference;

              QuerySnapshot querySnapshot = await warehouseRef.collection("Reviews").get();
              int numberOfReviews = querySnapshot.docs.length;

              DocumentSnapshot snapshot = await warehouseRef.get();
              dynamic currentRate = snapshot.get("Rating");
              dynamic newAverage = ((currentRate * numberOfReviews) + rating) / (numberOfReviews + 1);

              // update the rate
              await warehouseRef.update({
                "Rating" : newAverage
              });
              
              
              // // add the user's review in the Review collection
              await warehouseRef.collection("Reviews").add({
                "RP-ID" : notification.recycleProcessId,
                "comment" : reviewController.text,
                "datetime" : DateTime.now(),
                "rate" : rating,
              });

              myToast(
                message: "Thanks for your feedback",
                backgroundColor: Colors.green,
              );

              Navigator.pop(context);
            }
        ),
      ],
    );
  }

}
