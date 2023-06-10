part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final UserSignIn user;

  AuthSignInEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthSignUpEvent extends AuthEvent {
  final UserSignUp user;

  AuthSignUpEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthLogOutEvent extends AuthEvent {}
