part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String name;
  final String password;

  AuthSignUp(this.email, this.name, this.password);
}

final class AuthSignIn extends AuthEvent {}
