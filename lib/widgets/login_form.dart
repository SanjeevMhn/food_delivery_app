import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/form_field_model.dart';
import 'package:food_delivery/widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool showPassword = false;

  void toggleObscureText() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customFormField(
            FormFieldModel(
              controller: _emailController,
              label: "Email",
              hintText: "Email...",
              validationFn: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email Required';
                }

                final emailRegExp = RegExp(
                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'Invalid Email';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15.sp),
          customFormField(
            FormFieldModel(
              controller: _passwordController,
              label: "Password",
              hintText: "Password...",
              validationFn: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password Required';
                }

                if (value.length < 8) {
                  return 'Password must be atleast 8 characters long';
                }
                return null;
              },
              obscureText: showPassword,
              toggleObscureText: toggleObscureText,
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Color(0xFFE95322),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          Center(
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.go('/');
                }
              },
              child: SizedBox(
                width: 210.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.r,
                    horizontal: 15.r,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Color(0xFFE95322),
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.r,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go('/signup');
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE95322),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
