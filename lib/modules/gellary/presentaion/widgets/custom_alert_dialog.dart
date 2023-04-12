import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/widgets/gap.dart';

import 'dialog_elveated_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final void Function() galleryOnPresses;
  final void Function() cameraOnPresses;

  const CustomAlertDialog(
      {Key? key, required this.galleryOnPresses, required this.cameraOnPresses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      elevation: 0,

      backgroundColor: Colors.transparent,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(32.r),
        child: SizedBox(

          width: 270.w,
          height: 353.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.4),
                    width: double.infinity,
                    height: double.infinity,

                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DialogElevatedButton(
                    text: 'Gallery',
                    imagePath: 'assets/images/galleryLogo.png',
                    onPressed: galleryOnPresses,
                    color: Color(0xffEFD8F9),
                    iconSize: 60.h,
                  ),
                  Gap(
                    height: 44.h,
                  ),
                  DialogElevatedButton(
                    text: 'Camera',
                    imagePath: 'assets/images/cameraLogo.png',
                    onPressed: cameraOnPresses,
                    color: Color(0xffEBF6FF), iconSize: 60.h,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
