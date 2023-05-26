import 'dart:convert';

List<MealOrdered> mealOrderedListFromJson(String val) => List<MealOrdered>.from(
    json.decode(val).map((data) => MealOrdered.fromJson(data)));

class MealOrdered {
  final List<int> id;
  final String email;
  final List<String> name;
  final List<int> vendorId;

  MealOrdered({
    required this.id,
    required this.vendorId,
    required this.email,
    required this.name,
  });

  factory MealOrdered.fromJson(Map<dynamic, dynamic> data) => MealOrdered(
        email: data['email'] ?? 'Not Yet',
        id: List<int>.from(
            data['meal_ordereds'].map((data) => data['id'] ?? 0)),
        vendorId: List<int>.from(
            data['meal_ordereds'].map((data) => data['vendor']['id'] ?? 0)),
        name: List<String>.from(
            data['meal_ordereds'].map((data) => data['name'] ?? 'Not Yet')),
      );
}
