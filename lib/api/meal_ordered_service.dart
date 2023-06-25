import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:ebox/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/constants/const.dart';
import '../core/theme/app_colors.dart';

class MealOrderedService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/meal-ordered/meal_ordered';

  Future<dynamic> getMealOrdered({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> createMealOrder({
    required String name,
    required String token,
    required String totalPrice,
    required String paymentMethod,
    required String address,
    required List<dynamic> meals,
    required int vendor,
  }) async {
    var body = {
      "name": name,
      "totalPrice": totalPrice,
      "paymentMethod": paymentMethod,
      "address": address,
      "meals": meals,
      "vendor": vendor
    };
    var response = await client.post(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Order successful'.tr, 'You have order ${name} again',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: AppColors.secondaryColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      dashboardController.getMealOrdered();
    } else {
      Get.snackbar('Order ${name} is not working right now'.tr,
          'You have to order again',
          colorText: Colors.white,
          margin: REdgeInsets.all(15),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    return response;
  }
}
