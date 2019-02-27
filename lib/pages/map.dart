import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  CameraPosition currentPosition;
  GoogleMapController mapController;

  Future<Map<String, double>> getCurrentLocation() async {
    var location = Location();

    var currentLocation = await location.getLocation();

    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturents Near Me'),
      ),
      body: FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, AsyncSnapshot<Map<String, double>> snapshot) {
          if (snapshot.hasData) {
            var latitude = snapshot.data['latitude'];
            var longitude = snapshot.data['longitude'];

            currentPosition =
                CameraPosition(target: LatLng(latitude, longitude), zoom: 14.0);

            return GoogleMap(
              initialCameraPosition: currentPosition,
              onMapCreated: (controller) {
                mapController = controller;
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
