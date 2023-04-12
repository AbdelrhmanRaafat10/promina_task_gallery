import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/circular_progress_indicator.dart';
import '../cubit/gallery_cubit.dart';
import 'custom_gallery_grid_view.dart';
class GalleryGridView extends StatelessWidget {
  const GalleryGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      builder: (BuildContext context, state) {
        if (state is ImagesLoadingSucess) {
          return CustomGalleryGridView(
            imagesPath: state.images,
          );
        } else {
          return SizedBox(
              height: 1.sh / 2,
              child: const CustomCircularProgressIndicator());
        }
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}