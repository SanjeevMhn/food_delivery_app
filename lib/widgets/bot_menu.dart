import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/bot_menu_model.dart';

class BotMenu extends StatelessWidget {
  final BotMenuModel botMenu;
  const BotMenu({super.key, required this.botMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
          decoration: BoxDecoration(
            color: Color.fromRGBO(243, 233, 181, 1),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Icon(botMenu.icon, color: Color.fromRGBO(233, 83, 34, 1), size: 50.r),
        ),
        Text(
          botMenu.label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Color.fromRGBO(57, 23, 19, 1),
          ),
        ),
      ],
    );
  }
}
