part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  
}

class AuthError extends AuthState {
  final String errormessage;
  AuthError(this.errormessage);
}

class AuthLoginSuccess extends AuthState {
  final LoginResponse dataLogin;
  AuthLoginSuccess(this.dataLogin);
}
