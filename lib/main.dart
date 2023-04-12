import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/network/end_points.dart';

import 'package:promina_task/modules/gellary/presentaion/cubit/gallery_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_constance.dart';
import 'core/utils/pref_constants.dart';
import 'gallery_app.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diInit();
  AppConstance.isLoggedIn =
      (sl<SharedPreferences>().getString(PrefConstants.isLoggedInKey)) != null
          ? true
          : false;
  if ((sl<SharedPreferences>().getString(PrefConstants.isLoggedInKey)) !=
      null) {
    ApiConstants.token =
        sl<SharedPreferences>().getString(PrefConstants.isLoggedInKey);
  } else {}

  runApp(BlocProvider<GalleryCubit>(
    create: (BuildContext context) {
      return GalleryCubit(sl(), sl(), sl())..init();
    },
    child: const GalleryApp(),
  ));
}
