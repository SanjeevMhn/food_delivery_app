import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/widgets/login_form.dart';
import 'package:food_delivery/widgets/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFFF5CB58),
              padding: EdgeInsets.only(top: 35.r),
              child: Center(
                child: Text(
                  "New Account",
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Color(0xFFF5CB58),
              padding: EdgeInsets.only(top: 25.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 35.r, horizontal: 45.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    SignupForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
