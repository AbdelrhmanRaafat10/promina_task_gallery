import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promina_task/core/widgets/default_background.dart';

class LoginScreenBackground extends StatelessWidget {
  const LoginScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DefaultBackground(),

        Positioned(
          left: 41.w,
          top: 368.h,
          bottom: 170.h,
          right: 42.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: BackdropFilter(
              filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child:  Container(
                decoration:  BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.4)
                ),

              ),
            ),

          ),
        ),
        Positioned(
            top: -140.h,
            left: -95.w,

            height: 356.7.h,
            width: 371.53.w,
            child: SvgPicture.asset(
              "assets/images/wires.svg",

            )),
        Positioned(
            top: 58.h,
            left: 75.w,
            height: 131.56.h,
            width: 131.56.w,
            child: Image.asset(
              "assets/images/love_photography.png",
            )),
      ],
    );
  }
}
