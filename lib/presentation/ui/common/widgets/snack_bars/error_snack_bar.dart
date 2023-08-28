import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/core.dart';
import '../../../../../generated/l10n.dart';

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    required Exception exception,
    super.key,
  }) : super(
          content: _buildContent(exception),
          backgroundColor: Theme.of(_context).colorScheme.error,
        );


  static BuildContext get _context =>
      GetIt.instance<SnackBarService>().currentContext!;

  static Widget _buildContent(Exception exception) {
    final errorMessage = _getErrorMessage(exception);

    return Text(errorMessage);
  }

  static String _getErrorMessage(Exception exception) {
    final l10n = S.of(_context);

    if (exception is InvalidUserCredentialException) {
      return l10n.invalidUserCredentialError;
    } else if (exception is IncorrectDataException) {
      return l10n.incorrectDataError;
    } else if (exception is PasswordsNotMatchException) {
      return l10n.passwordsNotMatchError;
    } else if (exception is MissingConnectionException) {
      return l10n.missingConnectionError;
    } else if (exception is UserAlreadyAddedException) {
      return l10n.userAlreadyError;
    } else {
      return l10n.defaultErrorMessage;
    }
  }
}
