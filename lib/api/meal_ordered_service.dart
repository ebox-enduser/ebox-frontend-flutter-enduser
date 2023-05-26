import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/const.dart';

class MealOrderedService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/meal-ordered/meal_ordered';

  Future<dynamic> getCurrentOrderMeal() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getByUser({required String email}) async {
    var response = await client.get(Uri.parse(
        '$baseUrl/api/users?populate=meal_ordereds.vendor.image&filters[email][\$eq]=$email'));
    return response;
  }

  Future<dynamic> post({
    required String? name,
    required int? vendor,
  }) async {
    var body = {
      "data": {"name": name, "vendor": vendor}
    };
    var response = await client.post(
      Uri.parse(remoteUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }
}
