import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resourse_app.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LogInState.initial()) {
    on<EmailInputSignInEvent>(_emailInput);
    on<PasswordInputEvent>(_passwordInput);
    on<LogInSubmitEvent>(_logIn);
    on<LogInWithGoogleEvent>(_logInWithGoogle);
    on<ReSubmitVerificationEvent>(_reSubmit);
  }

  final AuthRepository _authRepository;

  void _emailInput(
    EmailInputSignInEvent event,
    Emitter<LogInState> emit,
  ) {
    final email = Email.dirty(value: event.value);

    final newState = state.copyWith(
      formStatus: state.validateWith(
        email: email,
      ),
      email: email,
    );

    emit(
      newState,
    );
  }

  void _passwordInput(
    PasswordInputEvent event,
    Emitter<LogInState> emit,
  ) {
    final password = Password.dirty(value: event.value);

    final newState = state.copyWith(
      formStatus: state.validateWith(password: password),
      password: password,
    );

    emit(
      newState,
    );
  }

  Future<void> _logIn(
    LogInSubmitEvent event,
    Emitter<LogInState> emit,
  ) async {
    if (!state.formStatus.isValidated) {
      return;
    }

    emit(
      state.copyWith(
        status: LogInStatus.loading,
      ),
    );

    try {
      final user = await _authRepository.logIn(
        email: state.email.value,
        password: state.password.value,
      );

      if (user.user != null) {
        if (user.user!.emailVerified) {
          emit(
            state.copyWith(
              status: LogInStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: LogInStatus.notVerified,
              user: user,
            ),
          );
        }
      }
    } on Exception {
      emit(
        state.copyWith(
          status: LogInStatus.failure,
        ),
      );
    }
  }

  Future<void> _logInWithGoogle(
    LogInWithGoogleEvent event,
    Emitter<LogInState> emit,
  ) async {
    try {
      await _authRepository.logInWithGoogle();

      emit(
        const LogInState(
          status: LogInStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: LogInStatus.failure,
        ),
      );
    }
  }

  Future<void> _reSubmit(
    ReSubmitVerificationEvent event,
    Emitter<LogInState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LogInStatus.loading,
      ),
    );

    try {
      await _authRepository.reSubmitVerification(
        user: state.user!,
      );

      emit(
        const LogInState(
          status: LogInStatus.reSubmit,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: LogInStatus.failure,
        ),
      );
    }
  }
}
