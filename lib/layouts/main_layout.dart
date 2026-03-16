import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/food_delivery_bottom_nav.dart';
import 'package:food_delivery/widgets/main_drawer.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      backgroundColor: Colors.white,
      bottomNavigationBar: FoodDeliveryBottomNav(),
      endDrawer: MainDrawer(),
    );
  }
}
