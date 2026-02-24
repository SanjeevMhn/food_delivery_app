import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(245, 203, 88, 1),
        padding: EdgeInsets.only(
          top: 50.r,
          left: 25.r,
          right: 25.r,
          bottom: 25.r,
        ),
      ),
    );
  }
}
