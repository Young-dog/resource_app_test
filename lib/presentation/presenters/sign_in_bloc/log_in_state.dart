part of 'log_in_bloc.dart';

enum LogInStatus {
  initial,
  loading,
  failure,
  success,
  reSubmit,
  notVerified;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isFailure => this == failure;

  bool get isSuccess => this == success;

  bool get isReSubmit => this == reSubmit;

  bool get isNotVerified => this == notVerified;
}

class LogInState extends Equatable {
  const LogInState({
    required this.status,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.pure,
    this.user,
  });

  final LogInStatus status;
  final FormStatus formStatus;
  final Email email;
  final Password password;
  final UserCredential? user;

  const LogInState.initial()
      : this(
          status: LogInStatus.initial,
        );

  LogInState copyWith({
    LogInStatus? status,
    FormStatus? formStatus,
    Email? email,
    Password? password,
    UserCredential? user,
  }) {
    return LogInState(
      status: status ?? this.status,
      formStatus: formStatus ?? this.formStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      user: user ?? this.user,
    );
  }

  FormStatus validateWith({
    Email? email,
    Password? password,
  }) {
    return FormStatus.validate(
      [
        email ?? this.email,
        password ?? this.password,
      ],
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        formStatus,
        user,
      ];
}
