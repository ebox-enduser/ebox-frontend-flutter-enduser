import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import 'map_screen.dart';

class EditLocationScreen extends StatelessWidget {
  final String name;
  final String address;
  final String description;

  const EditLocationScreen(
      {super.key,
      required this.name,
      required this.address,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
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
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text(name.tr),
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
                    controller: _descriptionController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: description,
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
                    child: Text(
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
                      labelText: 'Address',
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
