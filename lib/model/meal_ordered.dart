import 'dart:convert';

import 'package:get/get.dart';

List<MealOrdered> mealOrderedListFromJson(String val) => List<MealOrdered>.from(
    json.decode(val).map((data) => MealOrdered.fromJson(data)));

class MealOrdered {
  final int id;
  final String name;
  final DateTime createdAt;
  final String totalPrice;
  final String paymentMethod;
  final String address;
  final int idVendor;
  final String nameVendor;
  final String imageVendor;
  final String imageVendorBackground;
  final String businessTime;
  final String phoneNumber;
  final int delivery;
  final String distance;
  final String ordered;
  final String duration;
  final DateTime createdAtVendor;
  final String location;
  final List<String> nameMeal;
  final List<String> foodType;
  final List<int> price;
  final List<int> idMeal;
  final List<int> fat;
  final List<String> imageMeal;
  final List<String> youtubeURL;
  final List<String> ingredients;
  final List<String> nameMealVendor;
  final List<String> foodTypeVendor;
  final List<int> priceVendor;
  final List<int> idMealVendor;
  final List<int> fatVendor;
  final List<String> imageMealVendor;
  final List<String> youtubeURLVendor;
  final List<String> ingredientsVendor;
  MealOrdered({
    required this.address,
    required this.id,
    required this.name,
    required this.createdAt,
    required this.totalPrice,
    required this.paymentMethod,
    required this.location,
    required this.idVendor,
    required this.nameVendor,
    required this.businessTime,
    required this.phoneNumber,
    required this.delivery,
    required this.distance,
    required this.ordered,
    required this.duration,
    required this.createdAtVendor,
    required this.nameMeal,
    required this.foodType,
    required this.price,
    required this.idMeal,
    required this.fat,
    required this.youtubeURL,
    required this.ingredients,
    required this.imageMeal,
    required this.imageVendor,
    required this.imageVendorBackground,
    required this.nameMealVendor,
    required this.foodTypeVendor,
    required this.priceVendor,
    required this.idMealVendor,
    required this.fatVendor,
    required this.imageMealVendor,
    required this.youtubeURLVendor,
    required this.ingredientsVendor,
  });

  factory MealOrdered.fromJson(Map<dynamic, dynamic> data) => MealOrdered(
        id: data['id'] ?? 0,
        name: data['name'] ?? 'Not Yet'.tr,
        createdAt: DateTime.parse(data['createdAt'].toString()),
        totalPrice: data['totalPrice'].toString(),
        paymentMethod: data['paymentMethod'] ?? 'Not Yet'.tr,
        address: data['address'] ?? 'Not Yet'.tr,
        idVendor: data['vendor']['id'] ?? 0,
        nameVendor: data['vendor']['name'] ?? 'Not Yet'.tr,
        imageVendor: data['vendor']['image']['url'] ?? 'Not Yet'.tr,
        imageVendorBackground:
            data['vendor']['vendorImageBackground']['url'] ?? 'Not Yet'.tr,
        businessTime: data['vendor']['businessTime'] ?? 'Not Yet'.tr,
        phoneNumber: data['vendor']['phoneNumber'].toString(),
        delivery: data['vendor']['delivery'] ?? 0,
        distance: data['vendor']['distance'].toString(),
        ordered: data['vendor']['ordered'].toString(),
        duration: data['vendor']['duration'].toString(),
        createdAtVendor: DateTime.parse(data['vendor']['createdAt'].toString()),
        location: data['vendor']['location'] ?? 'Not Yet'.tr,
        nameMeal: List<String>.from(
            data['meals'].map((data) => data['title'] ?? 'Not Yet'.tr)),
        foodType: List<String>.from(
            data['meals'].map((data) => data['foodType'] ?? 'Not Yet'.tr)),
        price: List<int>.from(data['meals'].map((data) => data['price'] ?? 0)),
        fat: List<int>.from(data['meals'].map((data) => data['fat'] ?? 0)),
        youtubeURL: List<String>.from(
            data['meals'].map((data) => data['youtubeURL'] ?? 'Not Yet'.tr)),
        imageMeal: List<String>.from(
            data['meals'].map((data) => data['image']['url'] ?? 'Not Yet'.tr)),
        ingredients: List<String>.from(
            data['meals'].map((data) => data['ingredients'] ?? 'Not Yet'.tr)),
        idMeal: List<int>.from(data['meals'].map((data) => data['id'] ?? 0)),
        idMealVendor: List<int>.from(
            data['vendor']['meals'].map((data) => data['id'] ?? 0)),
        nameMealVendor: List<String>.from(data['vendor']['meals']
            .map((data) => data['title'] ?? 'Not Yet'.tr)),
        foodTypeVendor: List<String>.from(data['vendor']['meals']
            .map((data) => data['foodType'] ?? 'Not Yet'.tr)),
        priceVendor: List<int>.from(data['vendor']['meals']
            .map((data) => data['price'] ?? 'Not Yet'.tr)),
        fatVendor: List<int>.from(
            data['vendor']['meals'].map((data) => data['fat'] ?? 'Not Yet'.tr)),
        imageMealVendor: List<String>.from(data['vendor']['meals']
            .map((data) => data['image']['url'] ?? 'Not Yet'.tr)),
        youtubeURLVendor: List<String>.from(data['vendor']['meals']
            .map((data) => data['youtubeURL'] ?? 'Not Yet'.tr)),
        ingredientsVendor: List<String>.from(data['vendor']['meals']
            .map((data) => data['ingredients'] ?? 'Not Yet'.tr)),
      );
}
