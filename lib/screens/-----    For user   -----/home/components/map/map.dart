import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/core/Assets.dart';
import 'package:project/core/styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;
  double _currentZoom = 6.0;

  @override
  void initState() {
    super.initState();
    //_loadModel();
    _mapController = MapController();
  }

  void _zoomIn() {
    setState(() {
      _currentZoom = (_currentZoom + .7).clamp(2.0, 18.0);
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom = (_currentZoom - .7).clamp(2.0, 18.0);
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(Assets.logo, scale: 2,),
          title: Text("Warehouses Locations"),
          centerTitle: true,
        ),
        body: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: LatLng(26.8206, 30.8025),
                    zoom: _currentZoom,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: LatLng(30.0444, 31.2357), // Cairo
                          child: Icon(Icons.location_pin, color: AppColor.main, size: 40),
                        ),
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: LatLng(30.1444, 31.2357), // Cairo
                          child: Icon(Icons.location_pin, color: AppColor.main, size: 40),
                        ),
                      ],
                    ),
                  ],
                ),

                // Zoom Buttons
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        heroTag: "zoomIn",
                        onPressed: _zoomIn,
                        child: Icon(Icons.add),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        heroTag: "zoomOut",
                        onPressed: _zoomOut,
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
