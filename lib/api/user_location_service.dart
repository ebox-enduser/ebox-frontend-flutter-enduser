import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class UserLocationService {
  var client = http.Client();

  Future<dynamic> createUserLocation({
    required String name,
    required String description,
    required String position,
    required String address,
    required String token,
  }) async {
    var body = {
      "name": name,
      "description": description,
      "position": position,
      "address": address,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/user-location/location'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> getUserLocation({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/user-location/location'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
