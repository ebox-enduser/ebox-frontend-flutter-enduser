import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

// ignore: must_be_immutable
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
            padding: REdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 60.w,
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
                    width: 10.w,
                  ),
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              TextField(
                controller: ingredientsController,
                maxLines: 15,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: ingredient,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.r)),
                  hintStyle: TextStyle(
                      fontSize: 12.sp,
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
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
