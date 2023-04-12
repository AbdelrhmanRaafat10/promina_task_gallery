import 'package:dartz/dartz.dart';
import 'package:promina_task/modules/auth/domain/entities/user_entity.dart';

import '../../../../core/error/exception.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, UserEntity>> login (
    String email,
    String password,
  );
}
