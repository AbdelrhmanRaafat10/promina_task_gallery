import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:promina_task/modules/gellary/domain/entities/upload_entity.dart';
import 'package:promina_task/modules/gellary/domain/entities/user_galary_entity.dart';

import '../../../../core/error/exception.dart';

abstract class BaseGalleryRepository{


  Future<Either<Failure, UserGalleryEntity>> getGalleryImages ();
  Future<Either<Failure, UploadEntity>> uploadImage(File? file);




}