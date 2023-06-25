import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import 'map_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Color backgroundColor = Colors.grey.shade500;
  Color foregroundColor = Colors.grey;
  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 15),
                  child: TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    onChanged: (val) {
                      setState(() {
                        backgroundColor = val.isNotEmpty
                            ? AppColors.primaryColor
                            : Colors.grey.shade500;
                        foregroundColor =
                            val.isNotEmpty ? Colors.white : Colors.grey;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: settingController.userLocation.value?.name ??
                          'Name'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                Text(
                  'Description'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 15),
                  child: TextFormField(
                    controller: _descriptionController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText:
                          settingController.userLocation.value?.description ??
                              'Description'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const MapScreen()),
                        child: Center(
                          child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.location_on,
                                size: 30.r,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 270.w,
                        child: TextFormField(
                          controller: _addressController,
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            label: Text(
                                settingController.userLocation.value?.address ??
                                    'Location'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            hintStyle: TextStyle(fontSize: 14.sp),
                            labelStyle: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
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
            if (_nameController.text.isEmpty) {
              Get.snackbar(
                  'Something wrong!'.tr, 'You need to set your name first',
                  colorText: Colors.white,
                  margin: REdgeInsets.all(15),
                  backgroundColor: Colors.redAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2));
              return;
            } else {
              settingController.createUserLocation(
                  address: settingController.currentAddress.toString(),
                  description: _descriptionController.text,
                  name: _nameController.text,
                  position: settingController.currentPosition.toString());
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
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
