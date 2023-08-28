import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';
import '../widgets/change_password_button.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: theme.spacings.x4,
        ),
        PasswordInput(
          labelText: S.of(context).passwordLabel,
          onChanged: (value) {
            context.read<ResetPasswordBloc>().add(
                  NewPasswordInputResetPasswordEvent(
                    value: value,
                  ),
                );
          },
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        PasswordInput(
          labelText: S.of(context).confirmPasswordLabel,
          onChanged: (value) {
            context.read<ResetPasswordBloc>().add(
                  ConfirmPasswordInputResetPasswordEvent(
                    value: value,
                  ),
                );
          },
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        const PasswordDescription(),
        SizedBox(
          height: theme.spacings.x4,
        ),
        const ChangePasswordButton(),
      ],
    );
  }
}
