part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final Failure failure;
  const AuthFailure({required this.failure});

}

class ValidErrorState extends AuthState {}