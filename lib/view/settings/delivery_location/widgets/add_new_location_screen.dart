import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import 'map_screen.dart';

class AddNewLocationScreen extends StatelessWidget {
  const AddNewLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();

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
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text('Name'.tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text('Address'.tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => MapScreen());
                    },
                    child: const Text(
                      'Choose Your Location on Map',
                      style: TextStyle(color: Colors.white),
                    )),
                Padding(
                  padding: REdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    controller: _addressController,
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: 'Add New Location'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            Get.back();
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
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
