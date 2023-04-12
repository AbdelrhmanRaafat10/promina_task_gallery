import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:promina_task/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/modules/auth/presentation/screens/login_screen.dart';
import 'package:promina_task/modules/gellary/presentaion/screens/gallery_screen.dart';

import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String galleryRoute = '/gellary';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<AuthCubit>(
            create: (BuildContext context) {
              return AuthCubit(sl());
            },
            child: const LoginScreen(),
          );
        });
      case Routes.galleryRoute:
        return MaterialPageRoute(builder: (context) {
          return const GalleryScreen();
        });

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text("No Route Found"),
              ),
            )));
  }
}
