import 'dart:convert';

import 'package:get/get.dart';

List<Vendor> vendorListFromJson(String val) => List<Vendor>.from(
    json.decode(val)['data'].map((val) => Vendor.fromJson(val)));

class Vendor {
  final int idVendor;
  final String nameVendor;
  final String imageVendor;
  final String imageVendorBackground;
  final String duration;
  final int delivery;
  final List<int> idMeal;
  final String distance;
  final String ordered;
  final List<String> nameMeal;
  final String phoneNumber;
  final String businessTime;
  final List<String> imageMeal;
  final List<String> foodType;
  final List<int> price;
  final List<int> fat;
  final List<String> youtubeURL;
  final List<String> ingredients;
  final String location;

  Vendor({
    required this.idVendor,
    required this.imageVendor,
    required this.idMeal,
    required this.imageVendorBackground,
    required this.nameMeal,
    required this.imageMeal,
    required this.foodType,
    required this.price,
    required this.fat,
    required this.location,
    required this.nameVendor,
    required this.phoneNumber,
    required this.businessTime,
    required this.duration,
    required this.delivery,
    required this.distance,
    required this.youtubeURL,
    required this.ingredients,
    required this.ordered,
  });

  factory Vendor.fromJson(Map<dynamic, dynamic> data) => Vendor(
        idVendor: data['id'] ?? 'Not Yet'.tr,
        nameMeal: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['title'] ?? 'Not Yet'.tr)),
        idMeal: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['id'] ?? 'Not Yet'.tr)),
        foodType: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['foodType'] ?? 'Not Yet'.tr)),
        price: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['price'] ?? 0)),
        fat: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['fat'] ?? 0)),
        imageMeal: List<String>.from(data['attributes']['meals']['data'].map(
            (data) =>
                data['attributes']['image']['data']['attributes']['url'] ??
                'Not Yet'.tr)),
        location: data['attributes']['location'] ?? 'Not Yet'.tr,
        businessTime: data['attributes']['businessTime'] ?? 'Not Yet'.tr,
        nameVendor: data['attributes']['name'] ?? 'Not Yet'.tr,
        phoneNumber: data['attributes']['phoneNumber'].toString(),
        imageVendor: data['attributes']['image']['data']['attributes']['url'] ??
            'Not Yet'.tr,
        delivery: data['attributes']['delivery'] ?? 0,
        distance: data['attributes']['distance'].toString(),
        duration: data['attributes']['duration'].toString(),
        ordered: data['attributes']['ordered'].toString(),
        imageVendorBackground: data['attributes']['vendorImageBackground']
                ['data']['attributes']['url'] ??
            'Not Yet'.tr,
        ingredients: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['ingredients'] ?? 'Not Yet'.tr)),
        youtubeURL: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['youtubeURL'] ?? 'Not Yet'.tr)),
      );
}
