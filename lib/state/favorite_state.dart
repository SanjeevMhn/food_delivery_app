import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_detail_model.dart';

class FavoriteState extends ChangeNotifier {
  List<FoodDetailModel> favorites = [];

  List<FoodDetailModel> get getFavorites => favorites;

  bool checkIfFavorite(FoodDetailModel item) {
    return favorites.isNotEmpty
        ? favorites.any((food) => food.id == item.id)
        : false;
  }

  String toggleFavorite(FoodDetailModel item) {
    if (!checkIfFavorite(item)) {
      favorites.add(item);
      notifyListeners();
      return "Added to Favorites";
    } else {
      notifyListeners();
      favorites.removeWhere((food) => food.id == item.id);
      return "Removed from Favorites";
    }
  }
}
