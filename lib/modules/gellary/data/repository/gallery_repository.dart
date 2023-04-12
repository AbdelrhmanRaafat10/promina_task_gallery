
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:promina_task/core/error/exception.dart';
import 'package:promina_task/modules/gellary/data/datasource/remote_data_source.dart';
import 'package:promina_task/modules/gellary/domain/entities/upload_entity.dart';
import 'package:promina_task/modules/gellary/domain/entities/user_galary_entity.dart';
import 'package:promina_task/modules/gellary/domain/repository/gallery_repository.dart';

class GalleryRepositoryImp extends BaseGalleryRepository{
  final BaseGalleryRemoteDataSource remoteAuthDataSource;
  GalleryRepositoryImp(this.remoteAuthDataSource);

  @override
  Future<Either<Failure, UserGalleryEntity>> getGalleryImages() async {
    try {
      UserGalleryEntity userGalleryEntity = await remoteAuthDataSource.getGalleryImages();


      return Right(userGalleryEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UploadEntity>> uploadImage(File? file) async{
    try {
      UploadEntity uploadEntity = await remoteAuthDataSource.uploadImage(file);

    return Right(uploadEntity);
    } on Failure catch (e) {
    return left(e);
    }
  }
}