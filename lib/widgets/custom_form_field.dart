import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/form_field_model.dart';

Widget customFormField(FormFieldModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        model.label,
        style: TextStyle(
          color: Color(0xFF391713),
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.h),
      TextFormField(
        controller: model.controller,
        keyboardType: model.inputType ?? TextInputType.text,
        obscureText: model.obscureText != null ? !model.obscureText! : false,
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
            borderSide: BorderSide(color: const Color(0xFFC62828), width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: const Color(0xFFC62828), width: 1.0),
          ),
          errorStyle: TextStyle(color: Colors.red[800]),
          hintText: model.hintText,
          filled: true,
          fillColor: Color(0xFFF3E9B5),
          suffixIcon: model.obscureText != null
              ? IconButton(
                  onPressed: model.toggleObscureText,
                  icon: model.obscureText!
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
                )
              : null,
        ),
        validator: model.validationFn,
      ),
    ],
  );
}
