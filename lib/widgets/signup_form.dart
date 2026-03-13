import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/form_field_model.dart';
import 'package:food_delivery/widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  List<FormFieldModel> get fields => [
    FormFieldModel(
      label: 'Full Name',
      hintText: 'Full Name...',
      validationFn: (value) {
        if (value!.isEmpty) {
          return 'Full Name Required';
        }
        return null;
      },
      controller: _fullNameController,
    ),
    FormFieldModel(
      label: 'Email',
      hintText: 'Email...',
      validationFn: (value) {
        if (value == null || value.isEmpty) {
          return 'Email Required';
        }
        final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (!emailRegExp.hasMatch(value)) {
          return 'Invalid Email';
        }
        return null;
      },
      controller: _emailController,
    ),
    FormFieldModel(
      label: 'Password',
      hintText: 'Password',
      validationFn: (value) {
        if (value!.isEmpty) {
          return 'Password Required';
        }
        if (value.length < 8) {
          return 'Password must be atleast 8 characters long';
        }
        return null;
      },
      obscureText: showPassword,
      toggleObscureText: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
      controller: _passwordController,
    ),
    FormFieldModel(
      label: "Mobile Number",
      hintText: "Mobile Number",
      validationFn: (value) {
        if (value!.isEmpty) {
          return "Mobile Number Required";
        }
        if (value.length < 10) {
          return "Invalid Mobile Number";
        }
        return null;
      },
      controller: _mobileNumberController,
      inputType: TextInputType.phone,
    ),
  ];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String date = pickedDate.toString().split(' ')[0];
      _dobController.text = date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 15.h),
            itemCount: fields.length,
            itemBuilder: (context, index) {
              return customFormField(fields[index]);
            },
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
            controller: _dobController,
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: const Color(0xFFC62828),
                  width: 1.0,
                ),
              ),
              hintText: "mm/dd/yyyy",
              filled: true,
              fillColor: Color(0xFFF3E9B5),
              errorStyle: TextStyle(color: Colors.red[800]),
            ),
            onTap: () => _selectDate(context),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Date of Birth Required';
              }
              return null;
            },
          ),

          SizedBox(height: 60.h),
          Center(
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.go("/login");
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
