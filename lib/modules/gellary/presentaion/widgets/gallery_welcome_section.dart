import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/gap.dart';

class GalleryWelcomeSection extends StatelessWidget {
  const GalleryWelcomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(
          height: 35.h,
        ),
        Text(
          "Welcome",
          style: TextStyle(fontSize: 32.sp),
        ),
        Text(
          "Mina",
          style: TextStyle(fontSize: 32.sp),
        ),
        Gap(
          height: 44.h,
        ),
      ],
    );
  }
}