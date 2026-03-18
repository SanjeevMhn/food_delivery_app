import 'package:flutter/material.dart';

class FoodType {
  final int id;
  final String name;
  final Widget image;
  final String description;
  final double rating;
  final double price;
  FoodType({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.price,
  });
}
