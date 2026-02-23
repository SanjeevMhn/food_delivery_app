import 'package:flutter/material.dart';

class BotMenuModel {
  final int id;
  final IconData icon;
  final String label;
  bool isActive;

  BotMenuModel({required this.id, required this.icon, required this.label, this.isActive = false});
}
