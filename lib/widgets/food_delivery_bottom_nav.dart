import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodDeliveryBottomNav extends StatelessWidget {
  const FoodDeliveryBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.r),
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: BottomNavigationBar(
            onTap: (int index) {
              context.read<BotMenuState>().resetActiveBotMenu();
              context.go("/");
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(233, 83, 34, 1),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.room_service_outlined),
                label: "Recipe",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.support_agent_rounded),
                label: "Support",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
