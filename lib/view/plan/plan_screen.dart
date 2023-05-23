import 'package:ebox/view/plan/widgets/plan_list.dart';
import 'package:ebox/view/plan/widgets/plan_loading/plan_loading_list.dart';

import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controllers.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meal Plan".tr,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(() {
                if (dashboardController.planList.isNotEmpty) {
                  return PlanList(
                    plans: dashboardController.planList,
                  );
                } else {
                  return PlanLoadingList();
                }
              }),
            ],
          ),
        ),
      )),
    );
  }
}
