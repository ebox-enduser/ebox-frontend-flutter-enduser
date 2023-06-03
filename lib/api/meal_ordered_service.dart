import 'dart:convert';

import 'package:ebox/controller/controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/const.dart';

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
    return response;
  }
}
