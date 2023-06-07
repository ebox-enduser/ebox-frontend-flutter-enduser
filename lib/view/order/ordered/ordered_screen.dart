import 'package:ebox/view/order/ordered/widgets/ordered_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/controllers.dart';

class OrderedScreen extends StatelessWidget {
  const OrderedScreen({super.key});

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
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/receipt.png',
                      scale: 20.r,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Ordered History".tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (dashboardController.mealOrderedList.isNotEmpty) {
                  return OrderedList(
                    mealOrderedList: dashboardController.mealOrderedList,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
