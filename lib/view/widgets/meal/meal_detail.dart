import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/cart_meal.dart';
import 'package:ebox/view/widgets/meal/customize_ingredients_screen.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/vendor.dart';

class MealDetail extends StatefulWidget {
  final Vendor vendor;
  final String nameMeal;
  final String foodType;
  final int price;
  final int fat;
  final int idMeal;
  final int idVendor;
  final String mealImage;
  final String ingredient;
  final String youtubeURL;

  const MealDetail(
      {super.key,
      required this.nameMeal,
      required this.idVendor,
      required this.idMeal,
      required this.foodType,
      required this.price,
      required this.fat,
      required this.mealImage,
      required this.ingredient,
      required this.youtubeURL,
      required this.vendor});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;

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
                  fit: BoxFit.cover, image: NetworkImage(widget.mealImage)),
            ),
            child: Padding(
              padding: REdgeInsets.only(top: 30, left: 15),
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
                color: AppColors.secondaryBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.w),
                  topRight: Radius.circular(15.w),
                )),
            child: Padding(
                padding: REdgeInsets.all(15),
                child: Column(children: [
                  //title and price
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nameMeal,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
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
                                ': ${widget.foodType}',
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
                        '\$${widget.price}',
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
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 170.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white),
                            child: Padding(
                              padding: REdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        width: Get.width,
                                        height: 200.h,
                                        // decoration:
                                        //     BoxDecoration(color: Colors.red),
                                        child: Text(
                                          widget.ingredient,
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              overflow: TextOverflow.ellipsis,
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
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              // ignore: deprecated_member_use
                              await launch(
                                widget.youtubeURL,
                                forceSafariVC: false,
                                forceWebView: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            },
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Positioned(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 120.h,
                              )),
                              Positioned(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.mealImage),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(
                                  child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 120.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.black.withOpacity(0.2)),
                              )),
                              Positioned(
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.red,
                                  size: 30.r,
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  //add ingredient and add to cart

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CustomizeIngredientsScreen(
                                  mealImage: widget.mealImage,
                                  title: widget.nameMeal,
                                  ingredient: widget.ingredient,
                                ));
                          },
                          child: Container(
                            width: 160.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
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
                        Obx(() {
                          if (cartController.meals.entries
                              .map((meal) => meal.key.nameMeal)
                              .toList()
                              .contains(widget.nameMeal)) {
                            return Center(
                              child: SizedBox(
                                width: 160.w,
                                height: 40.h,
                                child: Icon(
                                  Icons.check_circle,
                                  color: AppColors.secondaryColor,
                                  size: 40.r,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 160.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Center(
                                child: AddToCartButton(
                                  trolley: Image.asset(
                                    'assets/images/cart.png',
                                    width: 20,
                                    height: 18,
                                    color: Colors.white,
                                  ),
                                  text: Text(
                                    'Add to cart'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  check: SizedBox(
                                    width: 40.w,
                                    height: 40.h,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20.r,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                  backgroundColor: AppColors.primaryColor,
                                  onPressed: (id) {
                                    if (cartController.meals.entries
                                        .map((meal) => meal.key.nameMeal)
                                        .toList()
                                        .contains(widget.nameMeal)) {
                                      setState(() {
                                        stateId = AddToCartButtonStateId.done;
                                      });
                                    } else {
                                      //handle logic when pressed on idle state button.
                                      setState(() {
                                        stateId =
                                            AddToCartButtonStateId.loading;
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          setState(() {
                                            cartController.addMealByVendor(
                                                meal: CartMeal(
                                                    nameMeal: widget.nameMeal,
                                                    imageMeal: widget.mealImage,
                                                    price: widget.price,
                                                    ingredient:
                                                        widget.ingredient,
                                                    idMeal: widget.idMeal,
                                                    idVendor: widget.idVendor),
                                                vendors: widget.vendor,
                                                context: context);
                                            stateId =
                                                AddToCartButtonStateId.done;
                                          });
                                        });
                                      });
                                    }
                                  },
                                  stateId: stateId,
                                ),
                              ),
                            );
                          }
                        }),
                      ])
                ])),
          ),
        )
      ],
    ));
  }
}
