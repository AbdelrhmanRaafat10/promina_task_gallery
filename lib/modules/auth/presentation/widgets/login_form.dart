import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/network/end_points.dart';
import 'package:promina_task/core/utils/extentions.dart';
import 'package:promina_task/core/utils/pref_constants.dart';
import 'package:promina_task/modules/auth/presentation/widgets/submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/circular_progress_indicator.dart';
import '../../../../injection_container.dart';
import 'custom_text_form_filed.dart';
import '../cubit/auth_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<AuthCubit>().formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "LOG IN",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            ),
            CustomTextFormFiled(
              controller: context.read<AuthCubit>().emailController,
              hintText: "User Name",
              keyboardType: TextInputType.emailAddress,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Enter your email.";
                }
                return null;
              },
            ),
            CustomTextFormFiled(
              controller: context.read<AuthCubit>().passwordController,
              hintText: "Password",
              obscureText: true,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Enter your password.";
                }
                return null;
              },
            ),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (BuildContext context, state) {
                final viewModel = BlocProvider.of<AuthCubit>(context);
                if (state is AuthLoading) {
                  return const CustomCircularProgressIndicator();
                }

                return SubmitButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState!.validate()) {

                      viewModel.login(viewModel.emailController.text,
                          viewModel.passwordController.text);

                    } else {
                      context.showSnackBar("email and password not valid");

                    }
                  },
                );
              },
              listener: (BuildContext context, Object? state) {
                if (state is AuthFailure) {
                  context.showSnackBar(state.failure.message);
                }
                if (state is AuthSuccess) {
                  sl<SharedPreferences>()
                      .setString(PrefConstants.isLoggedInKey, "Bearer ${state.user.token}" )
                      .then((value) {
                    if (value) {
                      ApiConstants.token = sl<SharedPreferences>()
                          .getString(PrefConstants.isLoggedInKey);
                      context.showSnackBar("Login Success",color: Colors.green);
                      Navigator.pushReplacementNamed(
                          context, Routes.galleryRoute);
                    }else{
                      context.showSnackBar("local storage error. Try again");
                    }
                  });
                }
              },
            )
          ],
        ));
  }
}
