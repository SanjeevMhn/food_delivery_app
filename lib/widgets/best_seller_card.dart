import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerCard extends StatelessWidget {
  final String image;
  final double price;
  const BestSellerCard({super.key, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: 75.w,
            height: 120.h,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10.r,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 83, 34, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.r),
                bottomLeft: Radius.circular(100.r),
              ),
            ),
            child: Text(
              '\$$price',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
