import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:project/core/Assets.dart';
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
                        if(myNotifications[index].rated)return;
                        print("Dialog");
                        showRateDialog(context, myNotifications[index].id);
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


  void showRateDialog(BuildContext context, notificationId) {
    showDialog(
      context: context,
      builder: (context) {
        return RateDialog(context, notificationId);
      },
    );
  }

  Widget RateDialog(context, notificationId) {
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
                  .doc(notificationId)
                  .update({
                'rated' : true,
              });

              Navigator.pop(context);
            }
        ),
      ],
    );
  }

}
