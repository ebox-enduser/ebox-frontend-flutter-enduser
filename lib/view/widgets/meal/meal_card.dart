import 'package:ebox/controller/cart_controller.dart';
import 'package:ebox/controller/controllers.dart';
import 'package:ebox/core/constants/const.dart';
import 'package:ebox/model/vendor.dart';

import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/cart_meal.dart';
import 'meal_detail.dart';

class MealCard extends StatelessWidget {
  final String mealName;
  final String foodType;
  final int price;
  final int fat;
  final String mealImage;
  final String ingredients;
  final String youtubeURL;
  final Vendor vendor;
  const MealCard(
      {Key? key,
      required this.mealName,
      required this.foodType,
      required this.price,
      required this.fat,
      required this.mealImage,
      required this.ingredients,
      required this.youtubeURL,
      required this.vendor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MealDetail(
              fat: fat,
              foodType: foodType,
              mealImage: mealImage,
              price: price,
              mealName: mealName,
              ingredients: ingredients,
              youtubeURL: youtubeURL,
              vendor: vendor,
            ));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            // decoration: BoxDecoration(color: Colors.blue),
          )),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: REdgeInsets.only(bottom: 10),
              child: Container(
                width: 140.w,
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: REdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Padding(
                    padding: REdgeInsets.only(left: 10, right: 10),
                    child: Column(children: [
                      Text(
                        mealName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: REdgeInsets.only(bottom: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${price}',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                            IconButton(
                                onPressed: () {
                                  // print(cartController.meals.entries
                                  //     .map((meal) => meal.key.mealName)
                                  //     .toList());
                                  // print(cartController.meals.entries
                                  //     .map((meal) => meal.key.mealName)
                                  //     .toList()
                                  //     .contains(mealName));

                                  if (cartController.meals.entries
                                      .map((meal) => meal.key.mealName)
                                      .toList()
                                      .contains(mealName)) {
                                    return;
                                  } else {
                                    cartController.addMealByVendor(
                                        meal: CartMeal(
                                            mealName: mealName,
                                            mealImage: mealImage,
                                            price: price),
                                        vendors: vendor,
                                        context: context);
                                  }
                                },
                                icon: Obx(
                                  () => Icon(
                                    cartController.meals.entries
                                            .map((meal) => meal.key.mealName)
                                            .toList()
                                            .contains(mealName)
                                        ? Icons.check_circle
                                        : Icons.add_circle,
                                    color: cartController.meals.entries
                                            .map((meal) => meal.key.mealName)
                                            .toList()
                                            .contains(mealName)
                                        ? AppColors.secondaryColor
                                        : AppColors.primaryColor,
                                    size: 40.r,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              child: Container(
                width: 80.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                        image: NetworkImage(mealImage), fit: BoxFit.cover)),
              )),
        ],
      ),
    );
  }
}
