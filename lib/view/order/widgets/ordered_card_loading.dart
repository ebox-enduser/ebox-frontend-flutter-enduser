import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/theme/app_colors.dart';

class OrderedCardLoading extends StatelessWidget {
  const OrderedCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: SizedBox(
            width: Get.width,
            height: 150.w,
            // decoration: BoxDecoration(color: Colors.red),
          )),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: REdgeInsets.all(15),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    width: 300.w,
                    height: 140.w,
                    child: Padding(
                      padding: REdgeInsets.only(
                          left: 45, right: 15, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 230.w,
                                child: Row(
                                  children: [
                                    Text(
                                      'mealOrdered.nameVendor',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'ds',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 1.00,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: AppColors.textColor),
                                ),
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  ' mealOrdered.name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: AppColors.textColor),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 230.w,
                                child: Row(
                                  children: [
                                    Text(
                                      "Total".tr,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Positioned(
              left: 20.w,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 40.r,
                ),
              )),
          Positioned(
            right: 40,
            bottom: 10,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              child: Text(
                'Order Again'.tr,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
