import 'package:ebox/model/meal_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ordered_card.dart';

class OrderedList extends StatelessWidget {
  const OrderedList(
      {super.key,
      required this.mealOrderedList,
      required this.scrollController});
  final List<MealOrdered> mealOrderedList;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: REdgeInsets.only(top: 15),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mealOrderedList.length,
        itemBuilder: (context, index) {
          return OrderedCard(
            mealOrdered: mealOrderedList.reversed.toList()[index],
            index: index,
          );
        });
  }
}
