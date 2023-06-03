class CartMeal {
  final String nameMeal;
  final int price;
  final int idMeal;
  final int idVendor;
  final String imageMeal;
  final String ingredient;

  CartMeal({
    required this.nameMeal,
    required this.price,
    required this.idMeal,
    required this.idVendor,
    required this.imageMeal,
    required this.ingredient,
  });

  static const List<CartMeal> meals = [];
}
