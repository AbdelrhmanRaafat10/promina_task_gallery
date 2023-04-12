

import 'package:dartz/dartz.dart';


import 'package:promina_task/core/error/exception.dart';


import 'package:promina_task/modules/auth/data/datasource/remote/remote_data_source.dart';
import 'package:promina_task/modules/auth/data/models/user_model.dart';
import 'package:promina_task/modules/auth/domain/entities/user_entity.dart';
import 'package:promina_task/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements BaseAuthRepository {
  final BaseAuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      UserModel user = await remoteDataSource.login(email, password);

      return Right(user);
    } on Failure catch (e) {



      return left(e);
    }
  }
}


