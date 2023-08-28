import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'inputs.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    this.onChanged,
    this.initialValue,
    this.textEditingController,
    super.key,
  });

  final void Function(String value)? onChanged;
  final String? initialValue;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FieldInput(
      style: theme.textTheme.labelLarge,
      labelText: S.of(context).usernameLabel,
      onChanged: onChanged,
      initialValue: initialValue,
      controller: textEditingController,
    );
  }
}
