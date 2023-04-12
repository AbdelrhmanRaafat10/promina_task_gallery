import 'package:dartz/dartz.dart';
import 'package:promina_task/modules/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/exception.dart';
import '../entities/user_entity.dart';

class LoginUsecase {
  LoginUsecase(this.authRepository);
  BaseAuthRepository authRepository;
  Future<Either<Failure, UserEntity>> call(String email, String password) async{
    return await authRepository.login(email, password);
  }
}
