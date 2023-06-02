import 'dart:async';

import 'package:ebox/view/order/ordering/complete_ordering_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RiderDelveringScreen extends StatelessWidget {
  const RiderDelveringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => Get.off(() => CompleteOrderingScreen()));
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
                      ),
                      Icon(Icons.check_circle)
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/delivery.png",
                  height: 300.h,
                  width: 300.w,
                ),
                Text(
                  "Rider delivering your meals",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        width: MediaQuery.of(context).size.height * 1,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text(
                    "Total: \$10",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "ETC: 40 mins",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                "Samlar Kako x3, Nom Banh Jok x1",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
