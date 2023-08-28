import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';
import '../widgets/reset_button.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
        EmailInput(
          onChanged: (value) {
            context
                .read<ResetPasswordBloc>()
                .add(EmailInputResetPasswordEvent(value: value));
          },
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        Text(
          S.of(context).descriptionResetPassword,
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        const ResetButton(),
      ],
    );
  }
}
