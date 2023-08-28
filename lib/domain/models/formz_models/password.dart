import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty({
    required String value,
  }) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    final isEmpty = value?.isEmpty ?? true;

    if (isEmpty) {
      return PasswordValidationError.empty;
    }
    return null;
  }
}
