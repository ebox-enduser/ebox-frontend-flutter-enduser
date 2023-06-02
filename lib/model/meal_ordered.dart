import 'dart:convert';

List<MealOrdered> mealOrderedListFromJson(String val) => List<MealOrdered>.from(
    json.decode(val).map((data) => MealOrdered.fromJson(data)));

class MealOrdered {
  final List<int> id;
  final String email;
  final List<DateTime> createdAt;
  final List<String> name;
  final List<String> address;
  final List<String> paymentMethod;
  final List<double> totalPrice;
  final List<String> vendorName;
  final List<String> businessTime;
  final List<String> phoneNumber;
  final List<int> delivery;
  final List<String> distance;
  final List<String> ordered;
  final List<String> duration;
  final List<String> vendorImage;
  final List<String> vendorImageBackground;
  final List<List<String>> mealName;
  final List<List<String>> mealImage;
  final List<List<String>> locations;
  final List<List<String>> foodType;
  final List<List<int>> fat;
  final List<List<String>> youtubeURL;
  final List<List<int>> price;
  final List<List<String>> ingredients;

  MealOrdered(
      {required this.id,
      required this.vendorName,
      required this.vendorImageBackground,
      required this.locations,
      required this.mealImage,
      required this.totalPrice,
      required this.address,
      required this.email,
      required this.paymentMethod,
      required this.name,
      required this.fat,
      required this.youtubeURL,
      required this.businessTime,
      required this.phoneNumber,
      required this.delivery,
      required this.distance,
      required this.ordered,
      required this.duration,
      required this.vendorImage,
      required this.mealName,
      required this.foodType,
      required this.price,
      required this.ingredients,
      required this.createdAt});

  factory MealOrdered.fromJson(Map<dynamic, dynamic> data) => MealOrdered(
        email: data['email'] ?? 'Not Yet',
        createdAt: List<DateTime>.from(data['meal_ordereds']
            .map((data) => DateTime.parse(data['createdAt'].toString()))),
        id: List<int>.from(
            data['meal_ordereds'].map((data) => data['id'] ?? 0)),
        vendorName: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['name'] ?? 'Not Yet')),
        name: List<String>.from(
            data['meal_ordereds'].map((data) => data['name'] ?? 'Not Yet')),
        businessTime: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['businessTime'] ?? 'Not Yet')),
        delivery: List<int>.from(data['meal_ordereds']
            .map((data) => data['vendor']['delivery'] ?? 0)),
        distance: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['distance'].toString())),
        duration: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['duration'].toString())),
        foodType: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(
                data['meals'].map((data) => data['foodType'] ?? 'Not Yet')))),
        ingredients: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(
                data['meals'].map((data) => data['ingredients'].toString())))),
        mealName: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(
                data['meals'].map((data) => data['title'] ?? 'Not Yet')))),
        ordered: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['ordered'].toString())),
        phoneNumber: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['phoneNumber'].toString())),
        price: List<List<int>>.from(data['meal_ordereds'].map((data) =>
            List<int>.from(data['meals'].map((data) => data['price'] ?? 0)))),
        vendorImage: List<String>.from(data['meal_ordereds']
            .map((data) => data['vendor']['image']['url'] ?? 'Not Yet')),
        totalPrice: List<double>.from(
            data['meal_ordereds'].map((data) => data['totalPrice'] ?? 0.0)),
        address: List<String>.from(
            data['meal_ordereds'].map((data) => data['address'] ?? 'Not Yet')),
        paymentMethod: List<String>.from(data['meal_ordereds']
            .map((data) => data['paymentMethod'] ?? 'Not Yet')),
        fat: List<List<int>>.from(data['meal_ordereds'].map((data) =>
            List<int>.from(data['meals'].map((data) => data['fat'] ?? 0)))),
        youtubeURL: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(
                data['meals'].map((data) => data['youtubeURL'] ?? 'Not Yet')))),
        mealImage: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(data['meals']
                .map((data) => data['image']['url'] ?? 'Not Yet')))),
        locations: List<List<String>>.from(data['meal_ordereds'].map((data) =>
            List<String>.from(data['vendor']['locations']
                .map((data) => data['name'] ?? 'Not Yet')))),
        vendorImageBackground: List<String>.from(data['meal_ordereds'].map(
            (data) =>
                data['vendor']['vendorImageBackground']['url'] ?? 'Not Yet')),
      );
}
