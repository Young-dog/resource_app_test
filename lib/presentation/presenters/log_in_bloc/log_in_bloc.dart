import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../presentation.dart';

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
    on<LogOutEvent>(_logOut);
    on<DeleteAccountEvent>(_onDeleteAccount);
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
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found' ||
          exception.code == 'wrong-password') {
        GetIt.instance<SnackBarService>().show(
          snackBar: ErrorSnackBar(
            exception: InvalidUserCredentialException(),
          ),
        );
      }
      emit(
        state.copyWith(
          status: LogInStatus.failure,
        ),
      );
    } on Exception {
      GetIt.instance<SnackBarService>().show(
        snackBar: ErrorSnackBar(
          exception: Exception(),
        ),
      );
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
    emit(
      state.copyWith(
        status: LogInStatus.loading,
      ),
    );
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

  Future<void> _logOut(
    LogOutEvent event,
    Emitter<LogInState> emit,
  ) async {
    try {
      await _authRepository.logOut();
    } on Exception {
      emit(
        state.copyWith(status: LogInStatus.failure),
      );
    }
  }

  Future<void> _onDeleteAccount(
      DeleteAccountEvent event,
      Emitter<LogInState> emit,
      ) async {
    try {
      await _authRepository.deleteAccount(uid: event.uid);
    } on Exception {
      emit(
        state.copyWith(status: LogInStatus.failure),
      );
    }
  }
}
