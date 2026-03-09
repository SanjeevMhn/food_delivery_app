import 'package:flutter/material.dart';
import 'package:food_delivery/state/drawer_state.dart';
import 'package:food_delivery/widgets/drawerWidgets/cart_drawer.dart';
import 'package:food_delivery/widgets/drawerWidgets/notifications_drawer.dart';
import 'package:food_delivery/widgets/drawerWidgets/profile_drawer.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return switch (context.read<DrawerState>().getDrawerType()) {
      DrawerType.cart => CartDrawer(),
      DrawerType.notifications => NotificationsDrawer(),
      DrawerType.profile => ProfileDrawer(),
      null => Placeholder(),
    };
  }
}
