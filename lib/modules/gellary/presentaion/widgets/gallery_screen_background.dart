import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/default_background.dart';

class GalleryScreenBackground extends StatelessWidget {
  const GalleryScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DefaultBackground(),
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  "assets/images/glass.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),
        Positioned(
          right: 32.w,
          top: 24.h,

          child: Image.asset("assets/images/man.png",
            width: 66.w,
            height: 66.h,),

        ),
      ],
    );
  }
}
