import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/meal_ordered.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/order/ordered/ordered_detail_screen.dart';
import 'package:ebox/view/order/ordering/complete_ordering_screen.dart';
import 'package:ebox/view/order/ordering/rider_delivering_screen.dart';
import 'package:ebox/view/order/ordering/finding_ingredients_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/theme/app_colors.dart';

class OrderedCard extends StatelessWidget {
  final MealOrdered mealOrdered;
  final int firstIndex;
  const OrderedCard({
    super.key,
    required this.mealOrdered,
    required this.firstIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: mealOrdered.name.length,
        itemBuilder: (context, index) {
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
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => OrderedDetailScreen(
                          index: index,
                          mealOrdered: mealOrdered,
                        ));
                  },
                  child: Padding(
                    padding: REdgeInsets.all(15),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
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
                                          mealOrdered.vendorName[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          timeago.format(
                                              mealOrdered.createdAt[index]),
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
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "#${mealOrdered.id[index]}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: AppColors.textColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      mealOrdered.name[index],
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
                                          ": \$${mealOrdered.totalPrice[index]}",
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
                    onTap: () {
                      Get.to(() => OrderedDetailScreen(
                            index: index,
                            mealOrdered: mealOrdered,
                          ));
                    },
                    child: CircleAvatar(
                      radius: 40.r,
                      foregroundImage:
                          NetworkImage(mealOrdered.vendorImage[index]),
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
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 0.h,
          );
        });
  }
}
