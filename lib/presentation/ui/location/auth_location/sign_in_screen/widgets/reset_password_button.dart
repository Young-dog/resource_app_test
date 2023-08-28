import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../ui.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TertiaryButton(
      onPressed: () {
        context.router.push(const ResetPasswordRoute());
      },
      child: Text(
        S.of(context).resetPasswordButtonTitle,
        style: theme.textTheme.labelLarge,
      ),
    );
  }
}
