import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState.initial()) {
    on<EmailInputResetPasswordEvent>(_emailInput);
    on<NewPasswordInputResetPasswordEvent>(_newPasswordInput);
    on<ConfirmPasswordInputResetPasswordEvent>(_confirmPasswordInput);
    on<SubmitEmailResetPasswordEvent>(_submitEmail);
  }

  void _emailInput(
    EmailInputResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    final email = Email.dirty(value: event.value);

    final newState = state.copyWith(
      formStatusFirst: state.validateEmail(
        email: email,
      ),
      email: email,
    );

    emit(
      newState,
    );
  }

  void _newPasswordInput(
    NewPasswordInputResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    final newPassword = NewPassword.dirty(value: event.value);

    final newState = state.copyWith(
      formStatusSecond: state.validatePassword(
        newPassword: newPassword,
      ),
      newPassword: newPassword,
    );

    emit(
      newState,
    );
  }

  void _confirmPasswordInput(
    ConfirmPasswordInputResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    final confirmPassword = ConfirmPassword.dirty(
        value: event.value, original: state.newPassword.value);

    final newState = state.copyWith(
      formStatusFirst: state.validatePassword(
        confirmPassword: confirmPassword,
      ),
      confirmPassword: confirmPassword,
    );

    emit(
      newState,
    );
  }

  Future<void> _submitEmail(
    SubmitEmailResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    if (!state.formStatusFirst.isValidated) {
      return;
    }

    emit(
      state.copyWith(
        status: ResetPasswordStatus.loading,
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: state.email.value);

      emit(
        const ResetPasswordState(
          status: ResetPasswordStatus.success,
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: ResetPasswordStatus.failure,
        ),
      );
    }
  }
}
