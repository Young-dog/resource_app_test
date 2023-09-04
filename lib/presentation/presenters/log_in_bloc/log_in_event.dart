part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LogInSubmitEvent extends LogInEvent {
  const LogInSubmitEvent();
}

class EmailInputSignInEvent extends LogInEvent {
  const EmailInputSignInEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object> get props => [
        value,
      ];
}

class PasswordInputEvent extends LogInEvent {
  const PasswordInputEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object> get props => [
        value,
      ];
}

class LogInWithGoogleEvent extends LogInEvent {
  const LogInWithGoogleEvent();
}

class ReSubmitVerificationEvent extends LogInEvent {
  const ReSubmitVerificationEvent();
}

class LogOutEvent extends LogInEvent {
  const LogOutEvent();
}
