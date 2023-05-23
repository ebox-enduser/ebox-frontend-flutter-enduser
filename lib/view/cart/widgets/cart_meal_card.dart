import 'package:ebox/controller/controllers.dart';
import 'package:ebox/core/constants/const.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/meal/meal_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../model/cart_meal.dart';

class CartMealCard extends StatelessWidget {
  final Vendor vendor;
  final CartMeal cartMeal;
  final int quantity;
  final int index;
  const CartMealCard({
    Key? key,
    required this.cartMeal,
    required this.quantity,
    required this.index,
    required this.vendor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => MealDetail(
                  mealName: vendor.mealName[index],
                  foodType: vendor.foodType[index],
                  price: vendor.price[index],
                  fat: vendor.fat[index],
                  mealImage: vendor.mealImage[index],
                  ingredients: vendor.ingredients[index],
                  youtubeURL: vendor.youtubeURL[index]));
            },
            child: Row(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                          image: NetworkImage(cartMeal.mealImage),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartMeal.mealName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '\$ ${cartMeal.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        vendor.ingredients[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    cartController.addMeal(meal: cartMeal);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: AppColors.secondaryColor,
                    size: 30.r,
                  )),
              Text(quantity.toString()),
              IconButton(
                  onPressed: () {
                    cartController.removeMeal(cartMeal);
                  },
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.redAccent,
                    size: 30.r,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
