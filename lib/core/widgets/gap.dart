import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  final double? height;
  final double width;

  const Gap({
    Key? key,
    this.height,
    this.width=0,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return height == null
        ? SizedBox(width: width.w)
        : SizedBox(height: height!.h);
  }
}
