part of 'sign_up_bloc.dart';

enum SignUpStatus {
  initial,
  loading,
  inputPass,
  failure,
  success;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isInputPass => this == inputPass;

  bool get isFailure => this == failure;

  bool get isSuccess => this == success;
}

class SignUpState extends Equatable {
  const SignUpState({
    required this.status,
    this.formStatusFirst = FormStatus.pure,
    this.formStatusSecond = FormStatus.pure,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
  });

  final SignUpStatus status;
  final FormStatus formStatusFirst;
  final FormStatus formStatusSecond;
  final Email email;
  final Username username;
  final NewPassword newPassword;
  final ConfirmPassword confirmPassword;

  const SignUpState.initial()
      : this(
          status: SignUpStatus.initial,
        );

  SignUpState copyWith({
    SignUpStatus? status,
    FormStatus? formStatusFirst,
    FormStatus? formStatusSecond,
    Email? email,
    Username? username,
    NewPassword? newPassword,
    ConfirmPassword? confirmPassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      formStatusFirst: formStatusFirst ?? this.formStatusFirst,
      formStatusSecond: formStatusSecond ?? this.formStatusSecond,
      email: email ?? this.email,
      username: username ?? this.username,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  FormStatus validateFirst({
    Email? email,
    Username? username,
  }) {
    return FormStatus.validate([
      email ?? this.email,
      username ?? this.username,
    ]);
  }

  FormStatus validateSecond({
    NewPassword? newPassword,
    ConfirmPassword? confirmPassword,
  }) {
    return FormStatus.validate([
      newPassword ?? this.newPassword,
      confirmPassword ?? this.confirmPassword,
    ]);
  }

  @override
  List<Object?> get props => [
        status,
        formStatusFirst,
        formStatusSecond,
        email,
        username,
        newPassword,
        confirmPassword,
      ];
}
