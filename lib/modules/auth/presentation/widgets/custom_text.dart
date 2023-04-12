import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMyGalleryText extends StatelessWidget {
  final String text;

  const CustomMyGalleryText( {Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: Color(0xff4A4A4A),
            fontSize: 50.sp,
            fontWeight: FontWeight.bold));
  }
}