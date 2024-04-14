part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String name;
  final String email;
  AuthLoginRequested({
    required this.name,
    required this.email,
  });
}

final class AuthLogoutRequested extends AuthEvent {}
