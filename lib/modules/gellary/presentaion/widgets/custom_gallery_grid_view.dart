import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGalleryGridView extends StatelessWidget {
  const CustomGalleryGridView({
    Key? key, required this.imagesPath,
  }) : super(key: key);

  final List<String> imagesPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 25.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
                imagesPath[index],
            fit: BoxFit.cover),
          );
        },
        itemCount: imagesPath.length,
      ),
    );
  }
}
