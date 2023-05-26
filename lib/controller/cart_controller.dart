import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:ebox/model/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';
import '../model/cart_meal.dart';

class CartController extends GetxController {
  var _meals = {}.obs;
  Rxn<Vendor> vendor = Rxn<Vendor>();

  Future<void> addMealByVendor(
      {required CartMeal meal,
      required Vendor vendors,
      required BuildContext context}) async {
    /// if it's not current vendor change vendor and clear meal in cart.
    if (vendor.value == null) {
      vendor.value = vendors;
    } else {
      if (vendors != vendor.value) {
        // ignore: use_build_context_synchronously
        if (await confirm(
          context,
          title: Text(
            'WARNING'.tr,
            style: TextStyle(color: AppColors.thirdlyColor),
          ),
          content: SizedBox(
            height: 90.h,
            child: Column(
              children: [
                Text(
                  'Would you sure like to pick meal in another vendor?'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'It will change the vendor in shopping cart'.tr,
                  style: TextStyle(color: AppColors.thirdlyColor),
                )
              ],
            ),
          ),
          textOK: const Text(
            'Yes',
            style: TextStyle(color: Colors.red),
          ),
          textCancel: const Text(
            'No',
            style: TextStyle(color: AppColors.secondaryColor),
          ),
        )) {
          Get.snackbar(vendor.value!.vendorName,
              'All Meal has been removed in shopping cart'.tr,
              colorText: Colors.white,
              margin: REdgeInsets.all(15),
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2));

          /// clear all meals and change to new vendor
          meals.clear();
          vendor.value = vendors;

          return print('pressedOK');
        }
        return print('pressedCancel');
      }
    }

    // print('vendors: ${vendors.name}');
    // print('vendor.value: ${vendor.value?.name}');
    // print('Meal: ${meals.length}');

    if (_meals.containsKey(meal)) {
      _meals[meal] += 1;
    } else {
      _meals[meal] = 1;
    }
    Get.snackbar('Meal Added'.tr,
        'You have add the ${meal.mealName} to the shopping cart',
        colorText: Colors.white,
        margin: REdgeInsets.all(15),
        backgroundColor: AppColors.secondaryColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void addMeal({required CartMeal meal}) {
    if (_meals.containsKey(meal)) {
      _meals[meal] += 1;
    } else {
      _meals[meal] = 1;
    }
    Get.snackbar('Meal Added'.tr,
        'You have add the ${meal.mealName} to the shopping cart',
        colorText: Colors.white,
        margin: REdgeInsets.all(15),
        backgroundColor: AppColors.secondaryColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void removeMeal(CartMeal meal) {
    if (_meals.containsKey(meal) && _meals[meal] == 1) {
      _meals.removeWhere((key, value) => key == meal);
      Get.snackbar('Meal Removed'.tr,
          'You have remove the ${meal.mealName} from the shopping cart',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      _meals[meal] -= 1;
      Get.snackbar('Meal Removed'.tr,
          'You have remove the ${meal.mealName} from the shopping cart',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
  }

  get meals => _meals;

  get mealSubtotal =>
      _meals.entries.map((meal) => meal.key.price * meal.value).toList();

  get total => _meals.entries
      .map((meal) => meal.key.price * meal.value)
      .toList()
      .reduce((value, element) => value + element);

  get quantity => _meals.entries
      .map((meal) => meal.value)
      .toList()
      .reduce((value, element) => value + element);
}
