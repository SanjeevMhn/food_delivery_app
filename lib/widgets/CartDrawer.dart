import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({super.key});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFE95322),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.r),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 65.r, bottom: 30.r),
                    child: Row(
                      spacing: 8.r,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.r,
                          height: 40.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Color(0xFFE95322),
                            ),
                          ),
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xFFF5CB58)),
                  SizedBox(height: 10.h),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  SizedBox(height: 20.h), // Spacing before the big empty state
                ],
              ),
            ),

            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Container(
                    width: 115.w,
                    height: 115.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.r),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 50.r, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Want to Add Something?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
