import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blured_circle_avatar.with.position.dart';



class DefaultBackground extends StatelessWidget {
  const DefaultBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurredCircleAvatarWithPosition(
          color: const Color(0xffEA94D7),
          height: 593.69.h,
          width: 468.13.w,
          top: 58.75.h,
          left: -196.86.w,
        ),
        BlurredCircleAvatarWithPosition(
          color: const Color(0xffFFDADA),
          height: 683.15.h,
          width: 538.67.w,
          top: 293.85,
          right: -60.5.w,
          left: -50.2.w,
        ),
        BlurredCircleAvatarWithPosition(
          color: const Color(0xffDDCDFF),
          height: 683.15.h,
          width: 538.67.w,
          right: -190.w,
          top: -77.h,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 1.sw,
              height: 414.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            )),
        Positioned(
          left: 47.3.w,
          top: 355.6.h,
          bottom: 97.8.h,
          right: 26.1.w,
          child: Image.asset(
            "assets/images/logosGroup.png",
            height: 572.58.h,
            width: 353.6.w,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
