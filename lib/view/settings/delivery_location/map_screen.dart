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
    settingController.permissionLocation();
    settingController.getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          child: Obx(
            () => FlutterMap(
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
                            settingController
                                .currentPosition!.value!.longitude),
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
        ),
        Positioned(
          top: 30,
          left: 15,
          child: GestureDetector(
            onTap: () {
              Get.back();
              Get.snackbar('Cancel!'.tr, 'You are not pick your location yet',
                  colorText: Colors.white,
                  margin: REdgeInsets.all(15),
                  backgroundColor: Colors.redAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2));
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: TextButton(
            onPressed: () {
              settingController.getCurrentLocation();
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
            onTap: () {
              settingController.getCurrentLocation();
              mapController.move(
                  LatLng(settingController.currentPosition!.value!.latitude,
                      settingController.currentPosition!.value!.longitude),
                  13);
            },
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
          child: Obx(
            () => Text(
              settingController.currentAddress!.value ?? 'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
