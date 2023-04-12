import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:promina_task/modules/gellary/domain/entities/upload_entity.dart';
import '../../../../core/error/exception.dart';

import '../repository/gallery_repository.dart';

class UploadImagesUsecase {
  UploadImagesUsecase(this.baseGalleryRepository);
  BaseGalleryRepository baseGalleryRepository;

  Future<Either<Failure, UploadEntity>> call(File? file) async{
    return await baseGalleryRepository.uploadImage(file);
  }
}
