import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'inputs.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
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
      controller: textEditingController,
      style: theme.textTheme.labelLarge,
      labelText: S.of(context).emailLabel,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }
}
