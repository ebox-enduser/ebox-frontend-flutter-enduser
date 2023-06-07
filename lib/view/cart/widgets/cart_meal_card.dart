import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/meal/meal_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => MealDetail(
                  nameMeal: vendor.nameMeal[index],
                  foodType: vendor.foodType[index],
                  price: vendor.price[index],
                  fat: vendor.fat[index],
                  mealImage: vendor.imageMeal[index],
                  ingredient: vendor.ingredients[index],
                  youtubeURL: vendor.youtubeURL[index],
                  vendor: vendor,
                  idMeal: vendor.idMeal[index],
                  idVendor: vendor.idVendor,
                ));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    image: DecorationImage(
                        image: NetworkImage(cartMeal.imageMeal),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                height: 80.h,
                child: Padding(
                  padding: REdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartMeal.nameMeal,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '\$${cartMeal.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.red),
                      ),
                      const Spacer(),
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
                ),
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
                  size: 25.r,
                )),
            Text(quantity.toString()),
            IconButton(
                onPressed: () {
                  cartController.removeMeal(cartMeal);
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                  size: 25.r,
                )),
          ],
        )
      ],
    );
  }
}
