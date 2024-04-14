part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessful extends AuthState {
  String name;
  String email;
  AuthSuccessful({required this.name, required this.email});
}

final class AuthFailure extends AuthState {
  String error;
  AuthFailure(this.error);
}

final class AuthLoading extends AuthState {}
