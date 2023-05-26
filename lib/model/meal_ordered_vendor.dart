import 'dart:convert';

List<MealOrderedVendor> mealOrderedVendorListFromJson(String val) =>
    List<MealOrderedVendor>.from(
        json.decode(val)['data'].map((val) => MealOrderedVendor.fromJson(val)));

class MealOrderedVendor {
  final int id;
  final String vendorName;
  final String vendorImage;
  final String vendorImageBackground;
  final String duration;
  final int delivery;
  final String distance;
  final String ordered;
  final List<String> mealName;
  final String phoneNumber;
  final String businessTime;
  final List<String> mealImage;
  final List<String> foodType;
  final List<int> price;
  final List<int> fat;
  final List<String> youtubeURL;
  final List<String> ingredients;
  final List<String> locations;

  MealOrderedVendor({
    required this.id,
    required this.vendorImage,
    required this.vendorImageBackground,
    required this.mealName,
    required this.mealImage,
    required this.foodType,
    required this.price,
    required this.fat,
    required this.locations,
    required this.vendorName,
    required this.phoneNumber,
    required this.businessTime,
    required this.duration,
    required this.delivery,
    required this.distance,
    required this.youtubeURL,
    required this.ingredients,
    required this.ordered,
  });

  factory MealOrderedVendor.fromJson(Map<dynamic, dynamic> data) =>
      MealOrderedVendor(
        id: data['id'] ?? 'Not Yet',
        mealName: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['title'] ?? 'Not Yet')),
        foodType: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['foodType'] ?? 'Not Yet')),
        price: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['price'] ?? 0)),
        fat: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['fat'] ?? 0)),
        mealImage: List<String>.from(data['attributes']['meals']['data'].map(
            (data) =>
                data['attributes']['image']['data']['attributes']['url'] ??
                'Not Yet')),
        locations: List<String>.from(data['attributes']['locations']['data']
            .map((location) => location['attributes']['name'] ?? 'Not Yet')),
        businessTime: data['attributes']['businessTime'] ?? 'Not Yet',
        vendorName: data['attributes']['name'] ?? 'Not Yet',
        phoneNumber: data['attributes']['phoneNumber'].toString() ?? 'Not Yet',
        vendorImage: data['attributes']['image']['data']['attributes']['url'] ??
            'Not Yet',
        delivery: data['attributes']['delivery'] ?? 0,
        distance: data['attributes']['distance'].toString() ?? 'Not Yet',
        duration: data['attributes']['duration'].toString() ?? 'Not Yet',
        ordered: data['attributes']['ordered'].toString() ?? 'Not Yet',
        vendorImageBackground: data['attributes']['vendorImageBackground']
                ['data']['attributes']['url'] ??
            'Not Yet',
        ingredients: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['ingredients'] ?? 'Not Yet')),
        youtubeURL: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['youtubeURL'] ?? 'Not Yet')),
      );
}
