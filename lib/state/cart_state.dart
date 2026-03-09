import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item_model.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> cart = [];

  List<CartItemModel> get getCart => cart;

  bool checkItemExists(CartItemModel item) {
    return cart.isNotEmpty ? cart.any((ct) => ct.id == item.id) : false;
  }

  void addToCart(CartItemModel item) {
    if(!checkItemExists(item)){
      cart.add(item);
      notifyListeners();
    }
  }
}
