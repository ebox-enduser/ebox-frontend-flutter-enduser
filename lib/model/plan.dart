import 'dart:convert';

List<Plan> planListFromJson(String val) =>
    List<Plan>.from(json.decode(val)['data'].map((val) => Plan.fromJson(val)));

class Plan {
  final int id;
  final String name;
  final String planImage;
  final List<String> mealName;
  final List<String> mealImage;
  final List<String> foodType;
  final List<int> price;
  final List<int> fat;
  final List<String> youtubeURL;
  final List<String> ingredients;

  Plan({
    required this.id,
    required this.planImage,
    required this.mealName,
    required this.mealImage,
    required this.foodType,
    required this.price,
    required this.fat,
    required this.name,
    required this.youtubeURL,
    required this.ingredients,
  });

  factory Plan.fromJson(Map<dynamic, dynamic> data) => Plan(
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
        name: data['attributes']['name'] ?? 'Not Yet',
        planImage: data['attributes']['image']['data']['attributes']['url'] ??
            'Not Yet',
        ingredients: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['ingredients'] ?? 'Not Yet')),
        youtubeURL: List<String>.from(data['attributes']['meals']['data']
            .map((data) => data['attributes']['youtubeURL'] ?? 'Not Yet')),
      );
}
