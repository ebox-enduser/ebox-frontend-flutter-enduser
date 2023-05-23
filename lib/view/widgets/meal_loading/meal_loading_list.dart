import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebox/model/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'meal_loading_card.dart';

class MealLoadingList extends StatefulWidget {
  @override
  State<MealLoadingList> createState() => _MealLoadingListState();
}

class _MealLoadingListState extends State<MealLoadingList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => MealLoadingCard(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 30.h),
    );
  }
}
