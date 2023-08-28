part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];
}

class EmailInputResetPasswordEvent extends ResetPasswordEvent {
  const EmailInputResetPasswordEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class NewPasswordInputResetPasswordEvent extends ResetPasswordEvent {
  const NewPasswordInputResetPasswordEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ConfirmPasswordInputResetPasswordEvent extends ResetPasswordEvent {
  const ConfirmPasswordInputResetPasswordEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class SubmitEmailResetPasswordEvent extends ResetPasswordEvent {
  const SubmitEmailResetPasswordEvent();
}

class SubmitPasswordResetPasswordEvent extends ResetPasswordEvent {
  const SubmitPasswordResetPasswordEvent();
}
