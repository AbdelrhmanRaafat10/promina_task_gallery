import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';

import '../entities/user_galary_entity.dart';
import '../repository/gallery_repository.dart';

class GetGalleryImagesUsecase {
  GetGalleryImagesUsecase(this.baseGalleryRepository);
  BaseGalleryRepository baseGalleryRepository;

  Future<Either<Failure, UserGalleryEntity>> call() async{
    return await baseGalleryRepository.getGalleryImages();
  }
}
