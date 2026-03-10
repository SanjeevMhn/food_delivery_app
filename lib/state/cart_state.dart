import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item_model.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> cart = [];

  List<CartItemModel> get getCart => cart;

  bool checkItemExists(CartItemModel item) {
    return cart.isNotEmpty ? cart.any((ct) => ct.id == item.id) : false;
  }

  void addToCart(CartItemModel item) {
    if (!checkItemExists(item)) {
      cart.add(item);
      notifyListeners();
    }
  }

  void increaseQuantity(CartItemModel item) {
    if (checkItemExists(item)) {
      final selectedItem = cart.firstWhere((ct) => ct.id == item.id);
      selectedItem.quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(CartItemModel item) {
    if (checkItemExists(item)) {
      final selectedItem = cart.firstWhere((ct) => ct.id == item.id);
      if (selectedItem.quantity > 1) {
        selectedItem.quantity -= 1;
        notifyListeners();
      }
    }
  }

  void removeCartItem(CartItemModel item) {
    if (checkItemExists(item)) {
      cart.removeWhere((ct) => ct.id == item.id);
      notifyListeners();
    }
  }

  double getSubTotal() {
    return cart.isEmpty
        ? 0.0
        : cart.fold(0.0, (previous, item) {
            return previous + (item.quantity * item.price);
          });
  }
}
