import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../presentation.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignUpState.initial()) {
    on<EmailInputSignUpEvent>(_emailInput);
    on<UsernameInputEvent>(_usernameInput);
    on<NewPasswordInputEvent>(_newPasswordInput);
    on<ConfirmPasswordInputEvent>(_confirmPasswordInput);
    on<InputPasswordEvent>(_inputPassword);
    on<SignUpSubmitEvent>(_submit);
    on<SignUpWithGoogleEvent>(_signUpWithGoogle);
  }

  final AuthRepository _authRepository;

  void _emailInput(
    EmailInputSignUpEvent event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(value: event.value);

    final newState = state.copyWith(
      email: email,
      formStatusFirst: state.validateFirst(
        email: email,
      ),
    );

    emit(
      newState,
    );
  }

  void _usernameInput(
    UsernameInputEvent event,
    Emitter<SignUpState> emit,
  ) {
    final username = Username.dirty(value: event.value);

    final newState = state.copyWith(
      username: username,
      formStatusFirst: state.validateFirst(
        username: username,
      ),
    );

    emit(
      newState,
    );
  }

  void _newPasswordInput(
    NewPasswordInputEvent event,
    Emitter<SignUpState> emit,
  ) {
    final newPassword = NewPassword.dirty(value: event.value);

    final newState = state.copyWith(
      newPassword: newPassword,
      formStatusSecond: state.validateSecond(
        newPassword: newPassword,
      ),
    );

    emit(
      newState,
    );
  }

  void _confirmPasswordInput(
    ConfirmPasswordInputEvent event,
    Emitter<SignUpState> emit,
  ) {
    final confirmPassword = ConfirmPassword.dirty(
      value: event.value,
      original: state.newPassword.value,
    );

    final newState = state.copyWith(
      confirmPassword: confirmPassword,
      formStatusSecond: state.validateSecond(
        confirmPassword: confirmPassword,
      ),
    );

    emit(
      newState,
    );
  }

  void _inputPassword(
    InputPasswordEvent event,
    Emitter<SignUpState> emit,
  ) {
    if (!state.formStatusFirst.isValidated) {
      GetIt.instance<SnackBarService>().show(
        snackBar: ErrorSnackBar(
          exception: IncorrectDataException(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: SignUpStatus.inputPass,
      ),
    );
  }

  Future<void> _submit(
    SignUpSubmitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    if (!state.formStatusSecond.isValidated) {
      GetIt.instance<SnackBarService>().show(
        snackBar: ErrorSnackBar(
          exception: PasswordsNotMatchException(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: SignUpStatus.loading,
      ),
    );
    try {
      await _authRepository.signUp(
        email: state.email.value,
        password: state.newPassword.value,
        username: state.username.value,
      );

      emit(
        state.copyWith(
          status: SignUpStatus.success,
        ),
      );
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'email-already-in-use') {
        GetIt.instance<SnackBarService>().show(
          snackBar: ErrorSnackBar(
            exception: UserAlreadyAddedException(),
          ),
        );
      }
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
        ),
      );
    }
  }

  Future<void> _signUpWithGoogle(
    SignUpWithGoogleEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      await _authRepository.logInWithGoogle();
      emit(
        state.copyWith(
          status: SignUpStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
        ),
      );
    }
  }
}
