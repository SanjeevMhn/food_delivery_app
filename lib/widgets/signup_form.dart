import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String date = pickedDate.toString().split(' ')[0];
      _dateController.text = date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Full Name",
            style: TextStyle(
              color: Color(0xFF391713),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.r),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              hintText: "Full Name..",
              filled: true,
              fillColor: Color(0xFFF3E9B5),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Email",
            style: TextStyle(
              color: Color(0xFF391713),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.r),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              hintText: "Email...",
              filled: true,
              fillColor: Color(0xFFF3E9B5),
            ),
            validator: (value) {
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
          SizedBox(height: 15.sp),
          Text(
            "Password",
            style: TextStyle(
              color: Color(0xFF391713),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Stack(
            children: [
              TextFormField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: 10.r,
                    left: 10.r,
                    right: 50.r,
                    bottom: 10.r,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: Color(0xFFF3E9B5),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: Color(0xFFF3E9B5),
                      width: 1.0,
                    ),
                  ),
                  hintText: "Password...",
                  filled: true,
                  fillColor: Color(0xFFF3E9B5),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: showPassword == true
                      ? Icon(
                          Icons.visibility_outlined,
                          size: 25.r,
                          color: Color(0xFFE95322),
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          size: 25.r,
                          color: Color(0xFFE95322),
                        ),
                ),
              ),
              SizedBox(height: 15.sp),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            "Mobile Number",
            style: TextStyle(
              color: Color(0xFF391713),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.r),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              hintText: "98********",
              filled: true,
              fillColor: Color(0xFFF3E9B5),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Date of Birth",
            style: TextStyle(
              color: Color(0xFF391713),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            readOnly: true,
            controller: _dateController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.r),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xFFF3E9B5), width: 1.0),
              ),
              hintText: "mm/dd/yyyy",
              filled: true,
              fillColor: Color(0xFFF3E9B5),
            ),
            onTap: () => _selectDate(context),
          ),

          SizedBox(height: 60.h),
          Center(
            child: InkWell(
              onTap: () {
                context.go('/login');
              },
              child: SizedBox(
                width: 210.w,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Color(0xFFE95322),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go('/login');
                  },
                  child: Text(
                    "Log In",
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
