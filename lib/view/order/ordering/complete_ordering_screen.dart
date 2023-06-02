import 'package:ebox/view/dashboard_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompleteOrderingScreen extends StatelessWidget {
  const CompleteOrderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: REdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.iconColor,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                          settingController.userLocation.value?.address ??
                              'Please set your location address first'.tr,
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 10.sp)),
                    ],
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(
                      left: 100, right: 100, top: 5, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.store,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.delivery_dining,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/done.png",
                  height: 300.h,
                  width: 300.w,
                ),
                Text(
                  "Your order is complete",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            Get.offAll(() => DashboardScreen());
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 5,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Confirm'.tr,
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
