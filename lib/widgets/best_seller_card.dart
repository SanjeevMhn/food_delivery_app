import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/best_seller.dart';

class BestSellerCard extends StatelessWidget {
  final BestSeller bestSeller;
  const BestSellerCard({super.key, required this.bestSeller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          child: Image.asset(
            bestSeller.image,
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
              '\$${bestSeller.price}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
