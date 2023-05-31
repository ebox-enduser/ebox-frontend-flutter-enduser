import 'package:ebox/controller/controllers.dart';
import 'package:ebox/core/constants/const.dart';
import 'package:ebox/model/cart_meal.dart';
import 'package:ebox/view/widgets/meal/customize_ingredients_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../cart/cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class MealDetail extends StatelessWidget {
  const MealDetail(
      {super.key,
      required this.mealName,
      required this.foodType,
      required this.price,
      required this.fat,
      required this.mealImage,
      required this.ingredients,
      required this.youtubeURL});
  final String mealName;
  final String foodType;
  final int price;
  final int fat;
  final String mealImage;
  final String ingredients;
  final String youtubeURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: Container()),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(mealImage)),
              ),
              child: Padding(
                padding: REdgeInsets.only(top: 45, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.black.withOpacity(0.4),
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.59,
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.w),
                      topRight: Radius.circular(15.w),
                    )),
                child: Padding(
                  padding: REdgeInsets.all(20),
                  child: Column(
                    children: [
                      //title and price
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mealName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Food Types'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp),
                                  ),
                                  Text(
                                    ': ${foodType}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '\$${price}',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Ingredients'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 170.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: AppColors.secondaryBackgroundColor),
                                child: Padding(
                                  padding:
                                      REdgeInsets.only(left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Expanded(
                                        child: Container(
                                            width: Get.width,
                                            height: 200.h,
                                            // decoration:
                                            //     BoxDecoration(color: Colors.red),
                                            child: Text(
                                              ingredients,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.textColor),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'How to Cook'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launch(
                                    youtubeURL,
                                    forceSafariVC: false,
                                    forceWebView: false,
                                    headers: <String, String>{
                                      'my_header_key': 'my_header_value'
                                    },
                                  );
                                },
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                          child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height: 120.h,
                                      )),
                                      Positioned(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: 120.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            image: DecorationImage(
                                                image: NetworkImage(mealImage),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height: 120.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                      )),
                                      const Positioned(
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.red,
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      //add ingredient and add to cart

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CustomizeIngredientsScreen(
                                    mealImage: mealImage,
                                    title: mealName,
                                    ingredient: ingredients,
                                  ));
                            },
                            child: Container(
                              width: 160.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryBackgroundColor,
                                  borderRadius: BorderRadius.circular(15.w)),
                              child: Center(
                                  child: Text(
                                'Customize Ingredient'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CartScreen());
                            },
                            child: Obx(() {
                              if (cartController.meals.isEmpty) {
                                return Container(
                                    width: 160.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15.w)),
                                    child: Center(
                                        child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 20.r,
                                    )));
                              } else {
                                return badges.Badge(
                                  position: badges.BadgePosition.topEnd(
                                      top: -15, end: 10),
                                  badgeContent: Text(
                                    cartController.quantity.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  child: Container(
                                      width: 160.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15.w)),
                                      child: Center(
                                          child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 20.r,
                                      ))),
                                );
                              }
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
