

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/utils/extentions.dart';


import 'package:promina_task/core/widgets/gap.dart';
import 'package:promina_task/modules/gellary/presentaion/cubit/gallery_cubit.dart';
import 'package:promina_task/modules/gellary/presentaion/widgets/custom_alert_dialog.dart';
import 'package:promina_task/modules/gellary/presentaion/widgets/gallery_gridview.dart';
import 'package:promina_task/modules/gellary/presentaion/widgets/gallery_screen_background.dart';

import '../../../../config/routes/app_routes.dart';
import '../widgets/custom_elevated_button.dart';

import '../widgets/gallery_welcome_section.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 1.sh,
          child: Stack(
            children: [
              const GalleryScreenBackground(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: SizedBox(
                  height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GalleryWelcomeSection(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          GalleryLogoutButton(),
                          GalleryUploadButton(),
                        ],
                      ),
                      Gap(
                        height: 34.1.h,
                      ),
                       const GalleryGridView(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class GalleryUploadButton extends StatelessWidget {
  const GalleryUploadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: 'upload ',
      svgAssetPath: 'assets/images/uploadIcon.svg',
      onPressed: () {
        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              galleryOnPresses: () {
                context
                    .read<GalleryCubit>()
                    .uploadImages(
                        source: ImageSource.gallery)
                    .then((value) =>
                        Navigator.pop(context));
              },
              cameraOnPresses: () {
                context
                    .read<GalleryCubit>()
                    .uploadImages(
                        source: ImageSource.camera)
                    .then((value) =>
                        Navigator.pop(context));
              },
            );
          },
        );
      },
    );
  }
}

class GalleryLogoutButton extends StatelessWidget {
  const GalleryLogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: 'log out',
      svgAssetPath: 'assets/images/logoutIcon.svg',
      onPressed: () {
        context
            .read<GalleryCubit>()
            .logout()
            .then((value) {
          if (value) {
            Navigator.pushReplacementNamed(
                context, Routes.initialRoute);
          } else {
            context.showSnackBar("Can't Logout. Try again.");
          }
        });
      },
    );
  }
}


