part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String token;

  Authenticated({required this.token});

  @override
  List<Object?> get props => [token];
}

class Unauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
