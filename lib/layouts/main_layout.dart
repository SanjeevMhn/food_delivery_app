import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/widgets/CartDrawer.dart';
import 'package:food_delivery/widgets/food_delivery_bottom_nav.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: FoodDeliveryBottomNav(),
      endDrawer: CartDrawer(),
    );
  }
}
