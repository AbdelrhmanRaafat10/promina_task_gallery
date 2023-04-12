import 'package:equatable/equatable.dart';

class UserEntity implements Equatable {
  final int id;
  final String name;
  final String email;
  final String token;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.token});

  @override
  List<Object?> get props => [id, name, email, token];

  @override
  bool? get stringify => true;
}
