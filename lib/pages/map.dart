import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  
  Future<LocationData> getCurrentLocation() async {
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
    );
  }
}