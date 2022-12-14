part of 'auth_bloc.dart';

abstract class AuthState {
  bool get isLoggedIn => SharedPreferencesService().getLoggedIn();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String username;

  AuthLoaded(
    this.username,
  );
}

class AuthError extends AuthState {}
