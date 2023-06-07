import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanLoadingCard extends StatelessWidget {
  const PlanLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 140.h,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Padding(
        padding: REdgeInsets.all(30.0),
        child: Text(
          'Healthy Plan',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
