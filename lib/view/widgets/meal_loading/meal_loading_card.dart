import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_colors.dart';

class MealLoadingCard extends StatelessWidget {
  const MealLoadingCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            child: Container(
          height: 150.h,
          // decoration: BoxDecoration(color: Colors.blue),
        )),
        Positioned(
          bottom: 0,
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3.r),
                  spreadRadius: 2.r,
                  blurRadius: 10.r,
                  offset: Offset(0.r, 3.r),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Column(children: [
                Text(
                  'Loading',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      size: 16.w,
                      color: AppColors.textColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.star,
                      size: 16.sp,
                      color: Colors.yellow.shade600,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
        Positioned(
            child: Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey.shade300,
          child: Container(
            width: 80.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: Colors.white,
            ),
          ),
        )),
      ],
    );
  }
}
