import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebox/model/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/meal/meal_card.dart';

class MealListVendor extends StatelessWidget {
  final Vendor vendor;
  const MealListVendor({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: vendor.mealName.length,
      itemBuilder: (context, index) => MealCard(
        fat: vendor.fat[index],
        foodType: vendor.foodType[index],
        mealImage: vendor.mealImage[index],
        price: vendor.price[index],
        mealName: vendor.mealName[index],
        ingredients: vendor.ingredients[index],
        youtubeURL: vendor.youtubeURL[index],
        vendor: vendor,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10.h),
    );
  }
}
