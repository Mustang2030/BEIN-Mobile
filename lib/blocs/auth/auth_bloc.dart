import 'package:bein_mobile/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInRequest>(signInRequest);
    on<SignOutRequest>(signOutRequested);
    on<CheckAuthStatus>(checkAuthStatus);
  }

  //Sign in and storing the JWT token securely
  Future<void> signInRequest(
      SignInRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await authRepository
          .signInUser({"email": event.email, "password": event.password});

      if (response["Success"] == true) {
        String token = response["token"]; //Getting token from API response here

        await storage.write(
            key: "authToken", value: token); //Storing token securely

        emit(Authenticated(token: token));
      } else {
        emit(AuthFailure(
            error: "Wrong credentials or other problems with the server"));
      }
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  //Signing out and deleting the token
  Future<void> signOutRequested(
      SignOutRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); //Show loading state

    try {
      await storage.delete(key: "authToken"); //Remove stored token
      await authRepository.signOut(); //Call API to sign out

      emit(Unauthenticated()); //Move to unauthenticated state
    } catch (e) {
      emit(AuthFailure(error: "Failed to sign out"));
    }
  }

  //Checking the Authentication Status
  Future<void> checkAuthStatus(CheckAuthStatus event, Emitter emit) async {
    String? token = await storage.read(key: "authToken");
    if (token != null) {
      emit(Authenticated(
          token: token)); //User has valid cridentials and is authenticated
    } else {
      emit(
          Unauthenticated()); //Token was not found or user is just not authenticated
    }
  }
}
