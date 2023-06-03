import 'dart:convert';

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
        idVendor: data['id'] ?? 'Not Yet',
        nameMeal: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['title'] ?? 'Not Yet')),
        idMeal: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['id'] ?? 'Not Yet')),
        foodType: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['foodType'] ?? 'Not Yet')),
        price: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['price'] ?? 0)),
        fat: List<int>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['fat'] ?? 0)),
        imageMeal: List<String>.from(data['attributes']['meals']['data'].map(
            (data) =>
                data['attributes']['image']['data']['attributes']['url'] ??
                'Not Yet')),
        location: data['attributes']['location'] ?? 'Not Yet',
        businessTime: data['attributes']['businessTime'] ?? 'Not Yet',
        nameVendor: data['attributes']['name'] ?? 'Not Yet',
        phoneNumber: data['attributes']['phoneNumber'].toString() ?? 'Not Yet',
        imageVendor: data['attributes']['image']['data']['attributes']['url'] ??
            'Not Yet',
        delivery: data['attributes']['delivery'] ?? 0,
        distance: data['attributes']['distance'].toString() ?? 'Not Yet',
        duration: data['attributes']['duration'].toString() ?? 'Not Yet',
        ordered: data['attributes']['ordered'].toString() ?? 'Not Yet',
        imageVendorBackground: data['attributes']['vendorImageBackground']
                ['data']['attributes']['url'] ??
            'Not Yet',
        ingredients: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['ingredients'] ?? 'Not Yet')),
        youtubeURL: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['youtubeURL'] ?? 'Not Yet')),
      );
}
