import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty,
}

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty({
    required String value,
  }) : super.dirty(value);

  @override
  UsernameValidationError? validator(String? value) {
    final isEmpty = value?.isEmpty ?? true;

    if (isEmpty) {
      return UsernameValidationError.empty;
    }

    return null;
  }
}
