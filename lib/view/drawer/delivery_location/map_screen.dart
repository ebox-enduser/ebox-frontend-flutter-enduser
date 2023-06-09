import 'package:ebox/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import '../../../../core/theme/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
                  subdomains: const ['a', 'b', 'c'],
                ),
                if (settingController.currentPosition?.value != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0.w,
                        height: 80.0.w,
                        point: LatLng(
                            settingController.currentPosition!.value!.latitude,
                            settingController
                                .currentPosition!.value!.longitude),
                        builder: (ctx) {
                          return Icon(
                            Icons.location_on,
                            color: AppColors.primaryColor,
                            size: 30.r,
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
          top: 30.w,
          left: 15.w,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.black.withOpacity(0.4),
              foregroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20.r,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15.w,
          child: TextButton(
            onPressed: () {
              settingController.getCurrentLocation();
              Get.back();
            },
            style: TextButton.styleFrom(
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
          bottom: 15.w,
          right: 15.w,
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
                child: Icon(
                  Icons.location_searching,
                  size: 30.r,
                )),
          ),
        ),
        Positioned(
          top: 80.w,
          left: 15.w,
          child: Obx(
            () => Text(
              settingController.currentAddress?.value ?? 'Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
        ),
      ]),
    );
  }
}
