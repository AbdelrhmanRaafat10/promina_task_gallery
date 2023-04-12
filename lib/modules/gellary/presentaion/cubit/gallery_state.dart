part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {
  const GalleryState();
}

class GalleryInitial extends GalleryState {

}
class ImagesLoadingSucess extends GalleryState{

  final List<String> images;
  const ImagesLoadingSucess(this.images);

}

class ImagesLoadingFail extends GalleryState{
final Failure failure;
const ImagesLoadingFail(this.failure);

}
class ImagesLoading extends GalleryState{

  const ImagesLoading();

}


class ImageUploadingSucess extends GalleryState{

  final  UploadEntity uploadEntity;
   const ImageUploadingSucess(this.uploadEntity);

}

class ImagesUploadingFail extends GalleryState{
  final Failure failure;
  const ImagesUploadingFail(this.failure);

}
class ImageUploading extends GalleryState{

  const ImageUploading();

}
