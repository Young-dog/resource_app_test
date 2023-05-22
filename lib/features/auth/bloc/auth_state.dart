part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {

}

class AuthLogInState extends AuthState {}


class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final Object failureException;

  AuthFailureState({required this.failureException});

  @override
  List<Object?> get props => [failureException];
}
