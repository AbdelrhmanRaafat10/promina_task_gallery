import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key, this.hintText, this.controller, this.validator, this.keyboardType, this.obscureText=false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: TextStyle(
          fontSize: 14.sp,
        ),
        hintStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff988F8C),
            fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 21.w, vertical: 13.h),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(22.0.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffF7F7F7), width: 0),
          borderRadius: BorderRadius.all(
              Radius.circular(22.0.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffF7F7F7), width: 0),
          borderRadius: BorderRadius.all(
              Radius.circular(22.0.r)),
        ),
        fillColor: const Color(0xffF7F7F7),
        filled: true,
      ),
      validator: validator,
    );
  }
}