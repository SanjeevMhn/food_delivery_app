import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/page_layout.dart';
import 'package:food_delivery/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      topSection: Center(
        child: Text(
          "Log In",
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      mainSection: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 40.h),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
