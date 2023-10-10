import 'package:formz/formz.dart';

enum NewPasswordValidationError {
  empty,
  invalid,
}

class NewPassword extends FormzInput<String, NewPasswordValidationError> {
  const NewPassword.pure() : super.pure('');

  const NewPassword.dirty({
    required String value,
  }) : super.dirty(value);

  static final _passwordRegExp =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])|(?=.*?[!@#$&*~]).{7,}$');

  @override
  NewPasswordValidationError? validator(String? value) {
    final isEmpty = value?.isEmpty ?? true;

    if (isEmpty) {
      return NewPasswordValidationError.empty;
    }

    if (!isEmpty && !_passwordRegExp.hasMatch(value!)) {
      return NewPasswordValidationError.invalid;
    }

    return null;
  }

}
