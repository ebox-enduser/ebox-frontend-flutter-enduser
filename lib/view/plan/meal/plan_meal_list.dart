import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/plan/meal/plan_meal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/plan.dart';
import '../../widgets/meal/meal_card.dart';

class MealListPlan extends StatelessWidget {
  final Plan plan;
  MealListPlan({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: plan.mealName.length,
      itemBuilder: (context, index) => PlanMealCard(
        fat: plan.fat[index],
        foodType: plan.foodType[index],
        ingredients: plan.ingredients[index],
        mealImage: plan.mealImage[index],
        mealName: plan.mealName[index],
        price: plan.price[index],
        youtubeURL: plan.youtubeURL[index],
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 0.h),
    );
  }
}
