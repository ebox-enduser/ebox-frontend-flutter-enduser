import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'meal_loading_card.dart';

class MealLoadingList extends StatefulWidget {
  const MealLoadingList({super.key});

  @override
  State<MealLoadingList> createState() => _MealLoadingListState();
}

class _MealLoadingListState extends State<MealLoadingList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => const MealLoadingCard(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 30.h),
    );
  }
}
