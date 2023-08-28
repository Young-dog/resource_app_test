import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalid,
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty({
    required String value,
  }) : super.dirty(
          value,
        );

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    final isEmpty = value?.isEmpty ?? true;

    if (isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegExp.hasMatch(value!)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
