import 'package:ebox/core/constants/const.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../cart/confirm_payment_screen.dart';

class CustomizeIngredientsScreen extends StatelessWidget {
  final String mealImage;
  final String title;
  final String ingredient;
  CustomizeIngredientsScreen(
      {super.key,
      required this.mealImage,
      required this.title,
      required this.ingredient});

  TextEditingController ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.all(15),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                            mealImage,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                controller: ingredientsController,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: ingredient,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(15.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(15.r)),
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300),
                ),
              )
            ]),
          ),
          title: 'Customize Ingredient'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Save'.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
