import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/bot_menu_model.dart';

class BotMenu extends StatelessWidget {
  final BotMenuModel botMenu;

  const BotMenu({super.key, required this.botMenu});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (botMenu.isActive)
          Positioned(
            bottom: 0,
            left: -40,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(width: 20, height: 20, color: Colors.white),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 83, 34, 1),
                    // color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                  ),
                ),
              ],
            ),
          ),

        Container(
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
                  color: Color.fromRGBO(57, 23, 19, 1),
                ),
              ),
            ],
          ),
        ),

        if (botMenu.isActive)
          Positioned(
            bottom: 0,
            right: -40,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(width: 20, height: 20, color: Colors.white),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 83, 34, 1),
                    // color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
