import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' show RatingBar;
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/core/Assets.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../models/warehouse.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: getAllWarehouses(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final List<Warehouse> warehouses = snapshot.data!.docs
              .map((e) => Warehouse.fromJson(
              e as DocumentSnapshot<Object?>))
              .toList();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Warehouse Branches'),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: warehouses.length,
                itemBuilder: (context, index) {
                  return WarehouseItemBuilderNew(context: context, warehouse: warehouses[index]);
                },
              ),
            ),
          );
        }
    );

  }

  Stream<QuerySnapshot> getAllWarehouses() {
    return FirebaseFirestore.instance
        .collection("warehouses")
        .snapshots();
  }

  Widget WarehouseItemBuilderNew({
    required Warehouse warehouse,
    required BuildContext context,
  }) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(Assets.mapMarker),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    warehouse.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  buildStarRating(warehouse.rating),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                          onPressed: (){
                            RateWarehouseWithoutProcess(context, warehouse);
                          }, child: Row(
                        children: [
                          Icon(Icons.reviews, color: Colors.orange[800],),
                          SizedBox(width: 5,),
                          Text("leave a review", style: TextStyle(color: Colors.orange[800]),),
                        ],
                      ))
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => openMap(warehouse.location),
              child: Row(
                children: [
                  Icon(Icons.map, color: Colors.blue),
                  SizedBox(width: 6),
                  Text(
                    'View on Map',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void RateWarehouseWithoutProcess(context, Warehouse warehouse){
    showDialog(
      context: context,
      builder: (context) {
        return RateWarehouseWithoutProcessDialog(context, warehouse);
      },
    );
  }

  Widget RateWarehouseWithoutProcessDialog(context, Warehouse warehouse){
    double rating = 3;
    TextEditingController reviewController = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.white,
      title: Center(child: Text("Rate ${warehouse.name}")),
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

              // Post the Review in the Warehouse -> Reviews Collection
              QuerySnapshot warehouseJson = await FirebaseFirestore.instance
                  .collection("warehouses")
                  .where("W-ID", isEqualTo: warehouse.wid)
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
                "RP-ID" : null,
                "comment" : reviewController.text,
                "datetime" : DateTime.now(),
                "rate" : rating,
                "U-ID": "${Provider.of<UserProvider>(context, listen: false).state.myUser.globalID}",
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
