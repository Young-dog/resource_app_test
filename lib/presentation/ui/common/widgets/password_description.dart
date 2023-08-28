import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class PasswordDescription extends StatelessWidget {
  const PasswordDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final msg = S.of(context).passDescription.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: msg
          .map(
            (e) => Text(
              '\u2022 $e',
              style: theme.textTheme.labelLarge,
            ),
          )
          .toList(),
    );
  }
}
