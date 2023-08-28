import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class FillingPasswordView extends StatelessWidget {
  const FillingPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: theme.spacings.x6,
        ),
        PasswordInput(
          labelText: S.of(context).passwordLabel,
          onChanged: (value) {
            context.read<SignUpBloc>().add(NewPasswordInputEvent(value: value));
          },
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        PasswordInput(
          labelText: S.of(context).confirmPasswordLabel,
          onChanged: (value) {
            context.read<SignUpBloc>().add(
                  ConfirmPasswordInputEvent(
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
        const SignUpSubmitButton(),
      ],
    );
  }
}
