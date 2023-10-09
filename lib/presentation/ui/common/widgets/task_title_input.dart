import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';

class TaskTitleInput extends StatelessWidget {
  const TaskTitleInput({
    required this.onChanged,
    this.initialValue,
    super.key,
  });

  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      initialValue: initialValue,
      maxLength: 150,
      maxLines: null,
      cursorColor: theme.palette.buttonPrimary,
      decoration: InputDecoration(
        counterText: '',
        hintText: S.of(context).taskTitleInput,
        hintStyle: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w800,
          color: theme.palette.textTertiary,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      style: theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w800,
      ),
      onChanged: onChanged,
    );
  }
}
