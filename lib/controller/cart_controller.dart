import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox/model/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';
import '../model/cart_meal.dart';

class CartController extends GetxController {
  final _meals = {}.obs;
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
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: 'WARNING'.tr,
          desc: 'Would you sure like to pick meal in another vendor?'.tr,
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            Get.snackbar(vendor.value!.nameVendor,
                'All Meal has been removed in shopping cart'.tr,
                colorText: Colors.white,
                margin: REdgeInsets.all(15),
                backgroundColor: Colors.redAccent,
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2));

            /// clear all meals and change to new vendor
            meals.clear();
            vendor.value = vendors;
          },
        ).show();
      } else {
        if (_meals.containsKey(meal)) {
          _meals[meal] += 1;
        } else {
          _meals[meal] = 1;
        }
        Get.snackbar('Meal Added'.tr,
            'You have add the ${meal.nameMeal} to the shopping cart',
            colorText: Colors.white,
            margin: REdgeInsets.all(15),
            backgroundColor: AppColors.secondaryColor,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    }
  }

  void addMeal({required CartMeal meal}) {
    if (_meals.containsKey(meal)) {
      _meals[meal] += 1;
    } else {
      Get.snackbar('Meal Added'.tr,
          'You have add the ${meal.nameMeal} to the shopping cart',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: AppColors.secondaryColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      _meals[meal] = 1;
    }
  }

  void removeMeal({required CartMeal meal}) {
    if (_meals.containsKey(meal) && _meals[meal] == 1) {
      _meals.removeWhere((key, value) => key == meal);
      Get.snackbar('Meal Removed'.tr,
          'You have remove the ${meal.nameMeal} from the shopping cart',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      _meals[meal] -= 1;
    }
  }

  get meals => _meals;

  get totalPrice => _meals.entries
      .map((meal) => meal.key.price * meal.value)
      .toList()
      .reduce((value, element) => value + element);

  get totalQuantity => _meals.entries
      .map((meal) => meal.value)
      .toList()
      .reduce((value, element) => value + element);

  /// all meal id in list
  get idMeals => _meals.entries.map((meal) => meal.key.idMeal).toList();

  /// display meal name with quantity of them
  get mealsWithQuantity => _meals.entries
      .map((meal) => '${meal.key.nameMeal} * ${meal.value}, ')
      .toList()
      .reduce((value, element) => value + element);

  get idVendor =>
      _meals.entries.map((meal) => meal.key.idVendor).toList().first;
}
