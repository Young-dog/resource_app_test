part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthSignInState extends AuthState {}

class AuthSignUpState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final Object failureException;

  AuthFailureState({required this.failureException});
}
