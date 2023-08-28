import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../generated/l10n.dart';
import '../../ui.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

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
        Text(
          S.of(context).emailVerifyDescription,
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        const GoBackButton(),
      ],
    );
  }
}
