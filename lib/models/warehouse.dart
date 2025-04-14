import 'package:latlong2/latlong.dart';

class Warehouse{
  String wid;
  String name;
  LatLng location;
  dynamic rating;
  // DateTime startTime;
  // DateTime endTime;

  Warehouse({
    required this.name,
    required this.location,
    required this.rating,
    // required this.endTime,
    // required this.startTime,
    required this.wid
});

  static Warehouse fromJson(dynamic snapshot) {
    LatLng locationFromJson = LatLng(snapshot.get("Location")["lat"], snapshot.get("Location")["lng"]);
    return Warehouse(
        name: snapshot.get("Name"),
        location: locationFromJson,
        rating: snapshot.get("Rating"),
        // endTime: endTime,
        // startTime: startTime,
        wid: snapshot.get("W-ID"),
    );
  }
}