
import 'package:promina_task/core/error/exception.dart';
import 'package:promina_task/core/network/api_helper.dart';
import 'package:promina_task/core/network/end_points.dart';
import 'package:promina_task/modules/auth/data/models/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class RemoteDataSource implements BaseAuthRemoteDataSource {
  final ApiHelper apiHelper;
  const RemoteDataSource(this.apiHelper);

  @override
  Future<UserModel> login(String email, String password) async {

    final response = await apiHelper.post(
        endPoint: ApiConstants.loginEndPoint,
        data: {"email": email, "password": password});

    if (response.statusCode == 200) {

      try {
        return UserModel.fromJson(response.data);
      } catch (e) {

        throw Failure(
          code: 200,
          error: 'Wrong email or password',
          message: 'wrong email or password',
        );

      }
    } else {

      throw Failure(
        code: response.statusCode?? 911,
        error: "Something Wrong.",
        message: 'Something Wrong,Try again later',
      );
    }
  }
}
