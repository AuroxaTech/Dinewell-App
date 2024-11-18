import 'dart:io';

import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/location_permission_service.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/page_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationFetchPage extends StatefulWidget {
  const LocationFetchPage({super.key});

  @override
  State<LocationFetchPage> createState() => _LocationFetchPageState();
}

class _LocationFetchPageState extends State<LocationFetchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ConstanceData.h53,
          height: MediaQuery.of(context).size.width / 1,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }

  //
  void initialise() {
    requestPermission(Permission.location);
  }

  Future<void> fetchCurrentLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currentLocation.latitude);
    print(currentLocation.longitude);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => PageScreen(currentLocation: currentLocation),
      ),
      (route) => false,
    );
  }

  requestPermission(Permission location) async {
    final status1 = await location.request();
    if (status1 == PermissionStatus.permanentlyDenied ||
        status1 == PermissionStatus.denied) {
      if (!Platform.isIOS) {
        UtilsFunctions.displayToast(
            "Permission is denied permanently, You can skip the use for location and use the app manually. Thank you");
      } else if (Platform.isIOS) {
        //
        UtilsFunctions.displayToast(
            "Permission is denied permanently. You can skip the use for location and use the app manually. Thank you");
      }
      Position currentLocation = Position(
          longitude: 0.0,
          latitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => PageScreen(currentLocation: currentLocation),
        ),
        (route) => false,
      );
    }

    if (status1 == PermissionStatus.granted) {
      fetchCurrentLocation();
    }
  }
}
