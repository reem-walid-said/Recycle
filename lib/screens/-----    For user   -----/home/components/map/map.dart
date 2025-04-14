import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/core/Assets.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
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
                  return WarehouseItemBuilder(warehouse: warehouses[index]);
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
}
