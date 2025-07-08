import 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}

class RegisterRequest extends AuthEvent {
  final String email;
  final String password;

  RegisterRequest({required this.email, required this.password});
}

class LogoutRequest extends AuthEvent {}