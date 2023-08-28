part of 'sign_up_bloc.dart';


abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class EmailInputSignUpEvent extends SignUpEvent {
  const EmailInputSignUpEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class UsernameInputEvent extends SignUpEvent {
  const UsernameInputEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
    value,
  ];
}

class NewPasswordInputEvent extends SignUpEvent {
  const NewPasswordInputEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
    value,
  ];
}

class ConfirmPasswordInputEvent extends SignUpEvent {
  const ConfirmPasswordInputEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [
    value,
  ];
}

class SignUpSubmitEvent extends SignUpEvent {
  const SignUpSubmitEvent();
}

class SignUpWithGoogleEvent extends SignUpEvent {
  const SignUpWithGoogleEvent();
}

class InputPasswordEvent extends SignUpEvent {
  const InputPasswordEvent();
}
