import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/meal_ordered.dart';
import 'package:ebox/view/order/ordered/ordered_card.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderedList extends StatelessWidget {
  const OrderedList({super.key, required this.mealOrdered});
  final List<MealOrdered> mealOrdered;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      child: ListView.builder(
          shrinkWrap: true,
          padding: REdgeInsets.only(top: 15),
          physics: NeverScrollableScrollPhysics(),
          itemCount: mealOrdered.length,
          itemBuilder: (context, index) {
            if (authController.user.value!.email == mealOrdered[index].email) {
              return OrderedCard(
                mealOrdered: mealOrdered[index],
                index: index,
              );
            } else {
              return Text('You are not order yet!');
            }
          }),
    );
  }
}
