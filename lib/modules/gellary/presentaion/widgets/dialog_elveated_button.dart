import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DialogElevatedButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final void Function()? onPressed;
  final Color color;
  final double iconSize;

  const DialogElevatedButton(
      {Key? key,
        required this.text,
        required this.imagePath,
        this.onPressed, required this.color, required this.iconSize, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166.w,
      height: 65.h,


      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            foregroundColor: Color(0xff4A4A4A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            textStyle: TextStyle(
              fontSize: 22.w,
              fontWeight: FontWeight.bold
            )),
        icon: Image.asset(imagePath,
          width: 30.w,
          height: 30.w,
            ),
        label: Text(text),
      ),
    );
  }
}
