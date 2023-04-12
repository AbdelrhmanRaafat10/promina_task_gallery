import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:promina_task/modules/gellary/domain/usecases/get_gallery_images_usecase.dart';
import 'package:promina_task/modules/gellary/domain/usecases/upload_image_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/utils/pref_constants.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/upload_entity.dart';
import '../../domain/entities/user_galary_entity.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(
      this.uploadImagesUsecase, this.getGalleryImagesUsecase, this.client)
      : super(GalleryInitial());

  GetGalleryImagesUsecase getGalleryImagesUsecase;
  UploadImagesUsecase uploadImagesUsecase;


  ApiHelper client;

  List<String> imagesPath = [];

  void init() async{

    ApiConstants.token = (sl<SharedPreferences>().getString(PrefConstants.isLoggedInKey));

     await getGalleryImages();
  }

  Future<void> getGalleryImages() async {
    emit(const ImagesLoading());

    Either<Failure, UserGalleryEntity> galleryResponse =
        await getGalleryImagesUsecase();

    galleryResponse.fold((l) {

      emit(ImagesLoadingFail(l));
    },
        (r) {

          imagesPath = r.images ?? [];
          emit(ImagesLoadingSucess(r.images ?? []));
        });
  }

  Future<bool> logout()async{

    return await sl<SharedPreferences>().remove(PrefConstants.isLoggedInKey);



  }

  Future<void> uploadImages({required ImageSource source}) async {


      XFile? pickedFile =
      await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        Either<Failure, UploadEntity> uploadResponse =
        await uploadImagesUsecase(File(pickedFile.path));

        uploadResponse.fold((l) => emit(ImagesUploadingFail(l)),
                (r) async {


              emit(ImageUploadingSucess(r));
              await getGalleryImages();
            });
      }








}

  }