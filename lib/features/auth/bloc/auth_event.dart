part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final UserSignIn user;

  AuthSignInEvent({required this.user});
}

class AuthSignUpEvent extends AuthEvent {
  final UserSignUp user;

  AuthSignUpEvent({required this.user});
}

class AuthLogOutEvent extends AuthEvent {}
