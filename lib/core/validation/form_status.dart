import 'package:formz/formz.dart';

enum FormStatus {
  pure,
  submissionInProgress,
  submissionFailure,
  submissionSuccess,
  valid,
  invalid;

  bool get isInitial => this == FormStatus.pure;
  bool get isSubmissionInProgress => this == FormStatus.submissionInProgress;
  bool get isSubmissionFailure => this == FormStatus.submissionFailure;
  bool get isSubmissionSuccess => this == FormStatus.submissionSuccess;
  bool get isValid => this == FormStatus.valid;
  bool get isFailure => this == FormStatus.invalid;

  bool get isValidated => [
        FormStatus.valid,
        FormStatus.submissionInProgress,
        FormStatus.submissionSuccess,
        FormStatus.submissionFailure,
      ].contains(this);

  static FormStatus validate(List<FormzInput<dynamic, dynamic>> inputs) {
    return inputs.every((element) => element.isPure)
        ? FormStatus.pure
        : inputs.any((input) => input.isNotValid)
            ? FormStatus.invalid
            : FormStatus.valid;
  }
}
