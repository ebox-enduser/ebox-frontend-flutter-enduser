import 'package:ebox/model/meal_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class OrderedCard extends StatelessWidget {
  final MealOrdered mealOrdered;
  final int index;
  const OrderedCard(
      {super.key, required this.mealOrdered, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            child: Container(
          width: Get.width,
          height: 150.h,
          // decoration: BoxDecoration(color: Colors.red),
        )),
        Positioned(
          right: 0,
          child: Padding(
            padding: REdgeInsets.all(15),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1.r,
                      blurRadius: 5.r,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                width: 300.w,
                height: 140.h,
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
                                  "Vendor A",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "1 day ago",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "#1",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11.sp, color: AppColors.textColor),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            mealOrdered.name[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11.sp, color: AppColors.textColor),
                          ),
                          Spacer(),
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
                                  ": \$${2}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                  ),
                                  child: Text(
                                    'Order Again'.tr,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
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
        Positioned(
            left: 20.w,
            child: CircleAvatar(
              radius: 40.r,
              foregroundImage: NetworkImage(
                  'https://blog.takemetour.com/wp-content/uploads/2019/03/Somlorkoko.jpg'),
            ))
      ],
    );
  }
}
