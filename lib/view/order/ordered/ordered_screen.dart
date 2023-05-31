import 'dart:ffi';

import 'package:ebox/controller/auth_controller.dart';
import 'package:ebox/view/order/ordered/ordered_card.dart';
import 'package:ebox/view/order/ordered/ordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/widgets/vendor/vendor_list.dart';

class OrderedScreen extends StatelessWidget {
  OrderedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.all(15),
                child: Text(
                  "Ordered History".tr,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                dashboardController.getMealOrdered(
                    email: authController.user.value!.email);
                if (dashboardController.mealOrderedList.isNotEmpty &&
                    dashboardController.mealOrderedList != null) {
                  return OrderedList(
                      mealOrdered: dashboardController.mealOrderedList);
                } else {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Image.asset(
                          'assets/images/no_order.png',
                          width: 300.w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'You have no order yet!'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.textColor),
                        )
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
