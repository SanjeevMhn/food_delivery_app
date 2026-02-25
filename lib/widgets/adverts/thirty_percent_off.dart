// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirtyPercentOffAd extends StatelessWidget {
  const ThirtyPercentOffAd({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: SizedBox(
        height: 150.h,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Color.fromRGBO(233, 83, 34, 1),
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10.r,
                  children: [
                    Text(
                      "Experience our delicious new dish",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "30% OFF",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/pizza.png',
                // width: 130,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
