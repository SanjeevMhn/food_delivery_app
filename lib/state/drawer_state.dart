import 'package:flutter/material.dart';

enum DrawerType { cart, notifications, profile }

class DrawerState extends ChangeNotifier {
  DrawerType? drawer;

  void setDrawerType(DrawerType type) {
    drawer = type;
    notifyListeners();
  }

  DrawerType? getDrawerType() {
    return drawer;
  }
}
