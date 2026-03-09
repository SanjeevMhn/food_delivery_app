import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_detail_model.dart';

class FoodsState extends ChangeNotifier {
  final List<FoodDetailModel> foods = [
    FoodDetailModel(
      id: 1,
      price: 110.35,
      image: 'assets/images/pancakes.jpg',
      name: 'Pancakes',
      ratings: 4.2,
    ),
    FoodDetailModel(
      id: 2,
      price: 50.25,
      image: 'assets/images/chowmein.jpg',
      name: 'Chowmein',
      ratings: 3.8,
    ),
    FoodDetailModel(
      id: 3,
      price: 12.99,
      image: 'assets/images/food.jpg',
      name: 'Pasta',
      ratings: 4.9,
    ),
    FoodDetailModel(
      id: 4,
      price: 8.25,
      image: 'assets/images/food_2.jpg',
      name: 'Baked Potetoes',
      ratings: 4.2,
    ),
    FoodDetailModel(
      id: 5,
      price: 28.25,
      image: 'assets/images/pizza.png',
      name: "Pizza",
      ratings: 5.0,
    ),
  ];

  List<FoodDetailModel> get getFoods => foods;

  FoodDetailModel getFoodById(int id) {
    return foods.firstWhere((food) => food.id == id);
  }
}
