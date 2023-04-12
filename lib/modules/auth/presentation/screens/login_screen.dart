
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';





import 'package:promina_task/modules/auth/presentation/widgets/login_form.dart';
import 'package:promina_task/modules/auth/presentation/widgets/login_screen_background.dart';


import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              const LoginScreenBackground(),
              Positioned(
                  bottom: 598.h ,
                  left: 127.w,
                  right: 127.w,
                  top: 206.h,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomMyGalleryText(text: "My"),
                      CustomMyGalleryText(text: "Gallery"),
                    ],
                  )),
              Positioned(
                left: 72.w,
                top: 416.h,
                bottom: 217.9.h,
                right: 73.6.w,
                child: Column(
                  children: const [
                    Expanded(
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

