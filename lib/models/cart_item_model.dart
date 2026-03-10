import 'package:food_delivery/models/food_detail_model.dart';

class CartItemModel extends FoodDetailModel {
 int quantity;
  CartItemModel({
    required super.id,
    required super.name,
    required super.ratings,
    required super.image,
    required super.price,
    this.quantity = 1,
  });
}
