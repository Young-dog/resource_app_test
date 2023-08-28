import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'inputs.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.labelText,
    this.onChanged,
    this.textEditingController,
    super.key,
  });

  final String labelText;
  final void Function(String value)? onChanged;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FieldInput(
      style: theme.textTheme.labelLarge,
      labelText: labelText,
      obscureText: true,
      onChanged: onChanged,
      controller: textEditingController,
    );
  }
}
