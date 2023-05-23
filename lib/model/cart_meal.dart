class CartMeal {
  final String mealName;
  final int price;
  final String mealImage;
  CartMeal({
    required this.mealName,
    required this.price,
    required this.mealImage,
  });

  static const List<CartMeal> meals = [];
}
