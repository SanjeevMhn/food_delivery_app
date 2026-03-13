import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrderConfirmedPage extends StatelessWidget {
  const OrderConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5CB58),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35.r, horizontal: 25.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: Icon(Icons.chevron_left),
                iconSize: 28.sp,
                color: Color(0xFFE95322),
              ),

              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE95322),
                            width: 10.w,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFFE95322),
                            size: 110.r,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Order Confirmed!",
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Your order has been placed successfully",
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Delivery by Tue Feb 21st, 12:00 PM to 16:00 PM",
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 18.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "If you have any questions, please reach out directly to our customer support",
                style: TextStyle(color: Color(0xFF391713), fontSize: 18.sp),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
