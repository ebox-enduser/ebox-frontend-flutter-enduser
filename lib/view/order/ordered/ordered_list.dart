import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/meal_ordered.dart';
import 'package:ebox/view/order/ordered/ordered_card.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderedList extends StatelessWidget {
  const OrderedList({super.key, required this.mealOrderedList});
  final List<MealOrdered> mealOrderedList;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      child: ListView.builder(
          shrinkWrap: true,
          padding: REdgeInsets.only(top: 15),
          physics: NeverScrollableScrollPhysics(),
          itemCount: mealOrderedList.length,
          itemBuilder: (context, index) {
            if (authController.user.value!.email ==
                mealOrderedList[index].email) {
              return OrderedCard(
                mealOrdered: mealOrderedList[index],
                firstIndex: index,
              );
            } else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Image.asset(
                      'assets/images/no_order.png',
                      width: 300.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'You have no order yet!'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppColors.textColor),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
