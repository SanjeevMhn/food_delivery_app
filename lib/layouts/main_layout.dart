import 'package:flutter/material.dart';
import 'package:food_delivery/state/connectivity_state.dart';
import 'package:food_delivery/widgets/food_delivery_bottom_nav.dart';
import 'package:food_delivery/widgets/main_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  NetworkStatus? lastStatus;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = Provider.of<ConnectivityState>(context, listen: false);
      lastStatus = provider.status;
      provider.addListener(handleConnectivityChange);
    });
  }

  void handleConnectivityChange() {
    final newStatus = Provider.of<ConnectivityState>(
      context,
      listen: false,
    ).status;

    if (lastStatus != newStatus) {
      if (newStatus == NetworkStatus.offline) {
        showSnackBar("You are offline", Colors.red);
      } else if (lastStatus == NetworkStatus.offline &&
          newStatus == NetworkStatus.online) {
        showSnackBar("Back Online", Colors.green);
      }

      lastStatus = newStatus;
    }
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center,),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<ConnectivityState>(
      context,
      listen: false,
    ).removeListener(handleConnectivityChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      backgroundColor: Colors.white,
      bottomNavigationBar: FoodDeliveryBottomNav(),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: MainDrawer(),
    );
  }
}
