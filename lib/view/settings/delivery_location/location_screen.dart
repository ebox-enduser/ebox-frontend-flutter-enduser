import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import 'map_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text(
                          settingController.userLocation.value?.name ?? 'name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    controller: _descriptionController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text(
                          settingController.userLocation.value?.description ??
                              'Address'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => MapScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor),
                    child: Text(
                      'Choose Your Location on Map',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    )),
                Obx(
                  () => Padding(
                    padding: REdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: _addressController,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        label: Text(
                            settingController.userLocation.value?.address ??
                                'Address'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        hintStyle: TextStyle(fontSize: 14.sp),
                        labelStyle: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: 'Delivery Location'),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            settingController.createUserLocation(
                address: settingController.currentAddress.toString(),
                description: _descriptionController.text,
                name: _nameController.text,
                position: settingController.currentPosition.toString());
          },
          style: TextButton.styleFrom(
            elevation: 5,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Save'.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
