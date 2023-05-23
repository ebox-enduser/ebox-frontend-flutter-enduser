import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebox/model/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/plan.dart';
import '../../widgets/meal/meal_card.dart';

class MealListPlan extends StatelessWidget {
  final Plan plan;
  const MealListPlan({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: plan.title.length,
      itemBuilder: (context, index) => CircularProgressIndicator(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 30.h),
    );
  }
}
