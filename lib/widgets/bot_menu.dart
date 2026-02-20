import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotMenu extends StatelessWidget {
  final IconData icon;
  final String label;
  const BotMenu({super.key, required this.icon, required this.label});

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
          child: Icon(icon, color: Color.fromRGBO(233, 83, 34, 1), size: 50.r),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Color.fromRGBO(57, 23, 19, 1),
          ),
        ),
      ],
    );
  }
}
