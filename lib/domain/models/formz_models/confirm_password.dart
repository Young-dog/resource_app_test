import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError {
  empty,
  notMatch,
}

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure()
      : original = '',
        super.pure('');

  const ConfirmPassword.dirty({
    required this.original,
    String value = '',
  }) : super.dirty(value);

  final String original;

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    final isEmpty = value?.isEmpty ?? true;

    if (isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }

    if (!isEmpty && !(value == original)) {
      return ConfirmPasswordValidationError.notMatch;
    }

    return null;
  }
}
