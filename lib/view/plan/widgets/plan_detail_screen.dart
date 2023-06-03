import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/controllers.dart';
import '../../../model/plan.dart';
import '../../home/widgets/meal_list_vendor.dart';
import '../../widgets/meal/meal_card.dart';
import '../../widgets/meal_loading/meal_loading_list.dart';

class PlanDetailScreen extends StatelessWidget {
  final Plan plan;
  const PlanDetailScreen({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: plan.nameMeal.length,
              itemBuilder: (context, index) => MealCard(
                fat: plan.fat[index],
                foodType: plan.foodType[index],
                mealImage: plan.imageMeal[index],
                price: plan.price[index],
                nameMeal: plan.nameMeal[index],
                ingredient: plan.ingredients[index],
                youtubeURL: plan.youtubeURL[index],
                idMeal: plan.idMeal[index],
                idVendor: 1,
                vendor: Vendor(
                    idVendor: 1,
                    imageVendor: plan.planImage,
                    imageVendorBackground: plan.planImage,
                    nameMeal: plan.nameMeal,
                    imageMeal: plan.imageMeal,
                    foodType: plan.foodType,
                    price: plan.price,
                    fat: plan.fat,
                    location: 'Not Yet',
                    nameVendor: plan.name,
                    phoneNumber: 'Not Yet',
                    businessTime: '07:00AM - 09:00PM',
                    duration: 'Not Yet',
                    delivery: 1,
                    distance: 'Not Yet',
                    youtubeURL: plan.youtubeURL,
                    ingredients: plan.ingredients,
                    ordered: 'Not Yet',
                    idMeal: plan.idMeal),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 0.h),
            ),
          ],
        ),
        title: plan.name);
  }
}
