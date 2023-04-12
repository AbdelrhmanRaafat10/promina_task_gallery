import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class CustomElevatedButton extends StatelessWidget {
  final String text;
  final String svgAssetPath;
  final void Function()? onPressed;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.svgAssetPath,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,


      child: ElevatedButton.icon(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          elevation: 0,

            backgroundColor: Colors.white.withOpacity(0.87),
            foregroundColor: const Color(0xff4A4A4A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 17.w,
            )),
        icon: SvgPicture.asset(
          svgAssetPath,
          width: 28.w,
          height: 28.h,
        ),
        label: Text(text),
      ),
    );
  }
}
