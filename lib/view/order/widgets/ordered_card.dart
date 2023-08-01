import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox/model/meal_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/theme/app_colors.dart';
import '../../../controller/controllers.dart';
import '../../dashboard_screen.dart';
import '../ordered_detail_screen.dart';

class OrderedCard extends StatelessWidget {
  final MealOrdered mealOrdered;
  final int index;
  const OrderedCard({
    super.key,
    required this.mealOrdered,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            onTap: () {
              Get.to(
                  () => OrderedDetailScreen(
                        index: index,
                        mealOrdered: mealOrdered,
                      ),
                  transition: Transition.fadeIn);
            },
            child: Padding(
              padding: REdgeInsets.all(15.r),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  width: 300.w,
                  height: 140.w,
                  child: Padding(
                    padding: REdgeInsets.only(
                        left: 45.r, right: 5.r, top: 15.r, bottom: 15.r),
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
                                    mealOrdered.nameVendor,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    timeago.format(mealOrdered.createdAt),
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
                                "#${mealOrdered.id}",
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
                                mealOrdered.name,
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
                                    ": \$${mealOrdered.totalPrice}",
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
                radius: 40.w,
                foregroundImage: NetworkImage(mealOrdered.imageVendor),
              ),
            )),
        Positioned(
          right: 30.w,
          bottom: 20.w,
          child: TextButton(
            onPressed: () {
              dashboardController.createMealOrder(
                address:
                    settingController.userLocation.value?.address ?? 'Not Yet',
                name: mealOrdered.name,
                paymentMethod: mealOrdered.paymentMethod,
                totalPrice: mealOrdered.totalPrice,
                meals: mealOrdered.idMeal,
                vendor: mealOrdered.idVendor,
              );
              cartController.vendor.value = null;
              cartController.meals.clear();
            },
            style: TextButton.styleFrom(
              fixedSize: Size(90.w, 30.w),
              textStyle: TextStyle(fontSize: 14.sp),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w)),
            ),
            child: Text(
              'Order Again'.tr,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ),
      ],
    );
  }
}
