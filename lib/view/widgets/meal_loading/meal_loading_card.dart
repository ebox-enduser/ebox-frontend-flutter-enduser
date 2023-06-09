import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_colors.dart';

class MealLoadingCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MealLoadingCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0.w,
            child: Container(
              width: 140.w,
              height: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(
                          bottom: 15.w, left: 15.w, right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$2',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle,
                              color: AppColors.primaryColor,
                              size: 30.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
              top: 0.w,
              child: Container(
                width: 80.w,
                height: 70.w,
              )),
          Positioned(
            top: 80.w,
            child: Text(
              'nameMeal',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
