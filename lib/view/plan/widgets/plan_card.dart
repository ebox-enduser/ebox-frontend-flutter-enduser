import 'package:ebox/view/plan/widgets/plan_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/plan.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;
  const PlanCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PlanDetailScreen(
              plan: plan,
            ));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: NetworkImage(plan.planImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          )),
          Positioned(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          )),
          Positioned(
            top: 15.h,
            left: 15.w,
            child: Text(
              plan.name.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}
