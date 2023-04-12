
import 'package:get_it/get_it.dart';
import 'package:promina_task/core/network/api_helper.dart';
import 'package:promina_task/modules/auth/data/datasource/remote/remote_data_source.dart';
import 'package:promina_task/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:promina_task/modules/auth/domain/repositories/auth_repository.dart';
import 'package:promina_task/modules/auth/domain/usecases/login_usecase.dart';
import 'package:promina_task/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/modules/gellary/data/datasource/remote_data_source.dart';
import 'package:promina_task/modules/gellary/domain/repository/gallery_repository.dart';
import 'package:promina_task/modules/gellary/domain/usecases/upload_image_usecase.dart';
import 'package:promina_task/modules/gellary/presentaion/cubit/gallery_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'modules/gellary/data/repository/gallery_repository.dart';
import 'modules/gellary/domain/usecases/get_gallery_images_usecase.dart';

final  sl = GetIt.instance;

Future<void> diInit() async {
  //! Features

  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => GalleryCubit(sl(),sl(),sl()));




  //Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetGalleryImagesUsecase(sl()));
  sl.registerLazySingleton(() => UploadImagesUsecase(sl()));



  //Repositories
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<BaseGalleryRepository>(() => GalleryRepositoryImp(sl()));



  //Data sources
  sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => RemoteDataSource(sl()));
  sl.registerLazySingleton<BaseGalleryRemoteDataSource>(() => RemoteAuthDataSource(sl()));


  //Core
  
  sl.registerLazySingleton<ApiHelper>(() => DioHelper());


  // External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);


}