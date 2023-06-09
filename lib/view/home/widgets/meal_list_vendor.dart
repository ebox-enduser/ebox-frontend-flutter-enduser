import 'package:ebox/model/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../widgets/meal/meal_card.dart';

class MealListVendor extends StatelessWidget {
  final Vendor vendor;
  const MealListVendor({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: vendor.nameMeal.length,
        itemBuilder: (context, index) => MealCard(
          fat: vendor.fat[index],
          foodType: vendor.foodType[index],
          mealImage: vendor.imageMeal[index],
          price: vendor.price[index],
          nameMeal: vendor.nameMeal[index],
          ingredient: vendor.ingredients[index],
          youtubeURL: vendor.youtubeURL[index],
          vendor: vendor,
          idMeal: vendor.idMeal[index],
          idVendor: vendor.idVendor,
          index: index,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20.w),
      ),
    );
  }
}
