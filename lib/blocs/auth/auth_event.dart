part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequest extends AuthEvent {
  final String email;
  final String password;

  SignInRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOutRequest extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
