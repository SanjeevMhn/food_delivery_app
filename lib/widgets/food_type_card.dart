import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/food_type.dart';

class FoodTypeCard extends StatelessWidget {
  final FoodType food;
  const FoodTypeCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(food.image, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 8.h),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 15.r,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Color.fromRGBO(57, 23, 19, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 83, 34, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 83, 34, 1),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.r,
                          vertical: 2.r,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 2.r,
                          children: [
                            Text(
                              food.rating.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(244, 186, 27, 1),
                              size: 25.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${food.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color.fromRGBO(233, 83, 34, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  food.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromRGBO(57, 23, 19, 1),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 25.h),
        Divider(color: Color.fromRGBO(233, 83, 34, 1)),
        SizedBox(height: 25.h),
      ],
    );
  }
}
