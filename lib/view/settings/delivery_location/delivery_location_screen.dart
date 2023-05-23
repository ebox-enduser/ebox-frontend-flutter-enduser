import 'package:ebox/controller/auth_controller.dart';
import 'package:ebox/view/settings/delivery_location/widgets/location_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../core/theme/app_colors.dart';

class DeliveryLocationScreen extends StatelessWidget {
  DeliveryLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: DetailScreen(
          screen: Column(
            children: [
              LocationCard(),
            ],
          ),
          title: 'Delivery Location'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            // Get.to(() => ConfirmPaymentScreen());
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
            'Add New Location'.tr,
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
