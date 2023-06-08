import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/vendor.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/cart_meal.dart';
import 'meal_detail.dart';

class MealCard extends StatefulWidget {
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
  final int index;
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
      required this.vendor,
      required this.index})
      : super(key: key);

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => MealDetail(
                  fat: widget.fat,
                  foodType: widget.foodType,
                  mealImage: widget.mealImage,
                  price: widget.price,
                  nameMeal: widget.nameMeal,
                  ingredient: widget.ingredient,
                  youtubeURL: widget.youtubeURL,
                  vendor: widget.vendor,
                  idMeal: widget.idMeal,
                  idVendor: widget.idVendor,
                ),
            transition: Transition.rightToLeftWithFade);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0.h,
            child: Container(
              width: 160.w,
              height: 130.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      if (cartController.meals.entries
                          .map((meal) => meal.key.nameMeal)
                          .toList()
                          .contains(widget.nameMeal)) {
                        return SizedBox(
                          width: 160.w,
                          height: 40.h,
                          child: Center(
                            child: SizedBox(
                              width: 160.w,
                              height: 40.h,
                              child: Icon(
                                Icons.check_circle,
                                color: AppColors.secondaryColor,
                                size: 40.r,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              cartController.addMealByVendor(
                                  meal: CartMeal(
                                      nameMeal: widget.nameMeal,
                                      imageMeal: widget.mealImage,
                                      price: widget.price,
                                      ingredient: widget.ingredient,
                                      idMeal: widget.idMeal,
                                      idVendor: widget.idVendor),
                                  vendors: widget.vendor,
                                  context: context);
                            },
                            child: Container(
                                width: 160.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/cart.png',
                                      color: Colors.white,
                                      scale: 30.r,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Add to cart'.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }
                    }),
                  ]),
            ),
          ),
          Positioned(
              top: 0.h,
              left: 20.w,
              child: Container(
                width: 80.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                        image: NetworkImage(widget.mealImage),
                        fit: BoxFit.cover)),
              )),
          Positioned(
            top: 80.h,
            child: SizedBox(
              width: 130.w,
              child: Text(
                widget.nameMeal,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            right: 30.w,
            child: Text(
              '\$${widget.price}',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
