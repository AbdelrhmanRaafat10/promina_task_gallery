import 'dart:io';

import 'package:dio/dio.dart';
import 'package:promina_task/core/network/end_points.dart';
import 'package:promina_task/modules/gellary/data/models/upload_model.dart';
import 'package:promina_task/modules/gellary/data/models/user_gallery_model.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/api_helper.dart';

abstract class BaseGalleryRemoteDataSource {
  Future<UserGalleryModel> getGalleryImages();
  Future<UploadModel> uploadImage(File? file);

}

class RemoteAuthDataSource implements BaseGalleryRemoteDataSource {
  final ApiHelper apiHelper;
  const RemoteAuthDataSource(this.apiHelper);

  @override
  Future<UserGalleryModel> getGalleryImages() async {

    final response = await apiHelper.get(
        endPoint: ApiConstants.myGallery, token: ApiConstants.token);


    if (response.statusCode == 200) {


      return UserGalleryModel.fromJson(response.data);
    }
    if (response.statusCode == 500) {

      throw Failure(
        code: response.statusCode ?? 911,
        error: "Something Wrong. check token",
        message: 'try again later',
      );
    } else {

      throw Failure(
        code: response.statusCode ?? 911,
        error: "Something Wrong.",
        message: 'try again later',
      );
    }
  }



  @override
  Future<UploadModel> uploadImage(File? file) async {
    if(file != null){
      var formData =
      FormData.fromMap({"img": await MultipartFile.fromFile(file.path)});
      final response = await apiHelper.post(
          endPoint: ApiConstants.uploadImage,
          data: formData,
          token: ApiConstants.token);

      if (response.statusCode == 200) {
        return UploadModel.fromJson(response.data);
      }
      if (response.statusCode == 422) {
        throw Failure(
          code: 422,
          error: "no file found.",
          message: 'no file found,try again.',
        );
      }
      if (response.statusCode == 401) {
        throw Failure(
          code: 402,
          error: "you don't have access",
          message: 'access denied',
        );
      } else {
        throw Failure(
          code: response.statusCode ?? 911,
          error: "Something Wrong.",
          message: 'try again later',
        );
      }
    }else{
      throw Failure(
        code:  911,
        error: "Something Wrong.",
        message: 'canot upload the file',
      );

    }
    }




}
