import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/model/food_model.dart';
import 'package:flutter_doctors/core/utils/images.dart';

class ShopModel extends ChangeNotifier {
  final List<FoodModel> _foods = [
    //* salmon
    FoodModel(
      name: "Salmon egg",
      imagePath: Images.firstImage,
      price: 22,
      rating: "4.5",
    ), //* salmon
    FoodModel(
      name: "Tuna",
      imagePath: Images.secondImage,
      price: 40,
      rating: "4.9",
    ), //* salmon
  ];

  List<FoodModel> _cart = [];

  List<FoodModel> getFoods() => _foods;
  List<FoodModel> getCart() => _cart;

//* add to cart
  void addToCaet({required FoodModel foodItem, required int quantity}) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  //* remove from the cart
  void removeFromTheCart({required FoodModel foodItem}) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
