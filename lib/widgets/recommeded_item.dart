import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/recommeded_item_model.dart';

class RecommededItem extends StatelessWidget {
  final RecommededItemModel item;
  const RecommededItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10.r,
          left: 15.r,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 8.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 2.r,
              children: [
                Text(
                  item.rating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromRGBO(57, 23, 10, 1),
                  ),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color.fromRGBO(244, 186, 27, 1),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 15.r,
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
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
