import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/vendor.dart';

import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/cart_meal.dart';
import 'meal_detail.dart';

class MealCard extends StatelessWidget {
  final String nameMeal;
  final String foodType;
  final int price;
  final int fat;
  final int idMeal;
  final int idVendor;

  final String mealImage;
  final String ingredient;
  final String youtubeURL;
  final Vendor vendor;
  const MealCard(
      {Key? key,
      required this.nameMeal,
      required this.idMeal,
      required this.idVendor,
      required this.foodType,
      required this.price,
      required this.fat,
      required this.mealImage,
      required this.ingredient,
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
              nameMeal: nameMeal,
              ingredient: ingredient,
              youtubeURL: youtubeURL,
              vendor: vendor,
              idMeal: idMeal,
              idVendor: idVendor,
            ));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0.h,
            child: Container(
              width: 140.w,
              height: 130.h,
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
                          bottom: 15.h, left: 15.w, right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$$price',
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
                                    .map((meal) => meal.key.nameMeal)
                                    .toList()
                                    .contains(nameMeal)) {
                                  return;
                                } else {
                                  cartController.addMealByVendor(
                                      meal: CartMeal(
                                          nameMeal: nameMeal,
                                          imageMeal: mealImage,
                                          price: price,
                                          ingredient: ingredient,
                                          idMeal: idMeal,
                                          idVendor: idVendor),
                                      vendors: vendor,
                                      context: context);
                                }
                              },
                              icon: Obx(
                                () => Icon(
                                  cartController.meals.entries
                                          .map((meal) => meal.key.nameMeal)
                                          .toList()
                                          .contains(nameMeal)
                                      ? Icons.check_circle
                                      : Icons.add_circle,
                                  color: cartController.meals.entries
                                          .map((meal) => meal.key.nameMeal)
                                          .toList()
                                          .contains(nameMeal)
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
          Positioned(
              top: 0.h,
              child: Container(
                width: 80.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                        image: NetworkImage(mealImage), fit: BoxFit.cover)),
              )),
          Positioned(
            top: 80.h,
            child: Text(
              nameMeal,
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
