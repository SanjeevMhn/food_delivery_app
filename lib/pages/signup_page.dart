import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/page_layout.dart';
import 'package:food_delivery/widgets/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      topSection: Center(
        child: Text(
          "New Account",
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      mainSection: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 30.r),
        child: SignupForm(),
      ),
    );
  }
}
