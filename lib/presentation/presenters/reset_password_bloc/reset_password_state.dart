part of 'reset_password_bloc.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  failure,
  success;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isFailure => this == failure;

  bool get isSuccess => this == success;
}

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    required this.status,
    this.formStatusFirst = FormStatus.pure,
    this.formStatusSecond = FormStatus.pure,
    this.email = const Email.pure(),
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
  });

  final ResetPasswordStatus status;
  final FormStatus formStatusFirst;
  final FormStatus formStatusSecond;
  final Email email;
  final NewPassword newPassword;
  final ConfirmPassword confirmPassword;

  const ResetPasswordState.initial()
      : this(
          status: ResetPasswordStatus.initial,
        );

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    FormStatus? formStatusFirst,
    FormStatus? formStatusSecond,
    Email? email,
    NewPassword? newPassword,
    ConfirmPassword? confirmPassword,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      formStatusFirst: formStatusFirst ?? this.formStatusFirst,
      formStatusSecond: formStatusSecond ?? this.formStatusSecond,
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  FormStatus validateEmail({
    Email? email,
  }) {
    return FormStatus.validate([
      email ?? this.email,
    ]);
  }

  FormStatus validatePassword({
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
        newPassword,
        confirmPassword,
      ];
}
