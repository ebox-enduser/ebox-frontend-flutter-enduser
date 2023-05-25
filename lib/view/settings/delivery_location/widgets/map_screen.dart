import 'package:ebox/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/theme/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _permissionLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(11.5564, 104.9282),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              if (settingController.currentPosition!.value != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(
                          settingController.currentPosition!.value!.latitude,
                          settingController.currentPosition!.value!.longitude),
                      builder: (ctx) {
                        return const Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 15,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            style: TextButton.styleFrom(
              elevation: 5,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              padding:
                  REdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
            ),
            child: Text(
              'Save'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.sp),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: GestureDetector(
            onTap: () => _getCurrentLocation(),
            child: CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.thirdlyColor,
                foregroundColor: Colors.white,
                child: Icon(Icons.location_searching)),
          ),
        ),
        Positioned(
          top: 80,
          left: 15,
          child: Text(
            settingController.currentAddress.value ?? 'Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        settingController.currentPosition!.value = position;
      });
      _getAddressFromLatLng();
      mapController.move(
          LatLng(settingController.currentPosition!.value!.latitude,
              settingController.currentPosition!.value!.longitude),
          13);
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    // print(_currentPosition!.latitude);
    // print(_currentPosition!.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          settingController.currentPosition!.value!.latitude,
          settingController.currentPosition!.value!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        settingController.currentAddress.value =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  void _permissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }
}
