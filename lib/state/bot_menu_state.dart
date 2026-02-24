import 'package:flutter/material.dart';
import 'package:food_delivery/models/bot_menu_model.dart';

class BotMenuState extends ChangeNotifier {
  List<BotMenuModel> botMenus = [
    BotMenuModel(id: 1, icon: Icons.lunch_dining_outlined, label: "Snack"),
    BotMenuModel(id: 2, icon: Icons.restaurant_outlined, label: "Meal"),
    BotMenuModel(id: 3, icon: Icons.local_florist_outlined, label: "Vegan"),
    BotMenuModel(id: 4, icon: Icons.cake_outlined, label: "Desserts"),
    BotMenuModel(id: 5, icon: Icons.local_bar_outlined, label: "Drinks"),
  ];

  void setActiveBotMenu(int id) {
    List<BotMenuModel> newBotMenu = botMenus.map((item) {
      return BotMenuModel(
        id: item.id,
        icon: item.icon,
        label: item.label,
        isActive: false,
      );
    }).toList();
    botMenus = newBotMenu;
    var item = botMenus.firstWhere((item) => item.id == id);
    item.isActive = !item.isActive;
    notifyListeners();
  }

  void resetActiveBotMenu() {
    List<BotMenuModel> newBotMenu = botMenus.map((item) {
      return BotMenuModel(
        id: item.id,
        icon: item.icon,
        label: item.label,
        isActive: false,
      );
    }).toList();
    botMenus = newBotMenu;
    notifyListeners();
  }

  bool hasActiveBotMenu() {
    return botMenus.any((item) => item.isActive == true);
  }

  String? currentActiveBotMenu() {
    return hasActiveBotMenu()
        ? botMenus.firstWhere((menu) => menu.isActive == true).label
        : null;
  }
}
