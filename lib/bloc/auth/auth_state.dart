import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginAuthenticated extends AuthState {
  final User user;

  LoginAuthenticated(this.user);
}

class RegisterAuthenticated extends AuthState {
  final User user;

  RegisterAuthenticated(this.user);
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}