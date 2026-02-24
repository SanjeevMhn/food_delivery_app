import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/custom_shapes/active_rounded_menu.dart';
import 'package:food_delivery/models/bot_menu_model.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:provider/provider.dart';

class BotMenu extends StatelessWidget {
  final BotMenuModel botMenu;

  const BotMenu({super.key, required this.botMenu});

  @override
  Widget build(BuildContext context) {
    final hasActiveMenu = context.watch<BotMenuState>().hasActiveBotMenu();
    return CustomPaint(
      painter: botMenu.isActive ? ActiveRoundedMenu(color: Colors.white) : null,
      child: Container(
        padding: botMenu.isActive ? EdgeInsets.all(10.r) : null,
        decoration: botMenu.isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              )
            : null,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
              decoration: BoxDecoration(
                color: botMenu.isActive
                    ? Color.fromRGBO(245, 203, 88, 1)
                    : Color.fromRGBO(243, 233, 181, 1),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(
                botMenu.icon,
                color: Color.fromRGBO(233, 83, 34, 1),
                size: 50.r,
              ),
            ),
            Text(
              botMenu.label,
              style: TextStyle(
                fontSize: 12.sp,
                color: botMenu.isActive
                    ? Color.fromRGBO(57, 23, 19, 1)
                    : hasActiveMenu
                    ? Colors.white
                    : Color.fromRGBO(57, 23, 19, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
