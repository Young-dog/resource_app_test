import 'package:flutter/material.dart';
import '../../../../app/app.dart';

class TaskNote extends StatelessWidget {
  const TaskNote({
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
      maxLines: null,
      maxLength: 500,
      cursorColor: theme.palette.textTertiary,
      decoration: InputDecoration(
        counterText: '',
        hintText: 'Добавить заметку',
        hintStyle: theme.textTheme.bodySmall!.copyWith(
          color: theme.palette.textTertiary,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      style: theme.textTheme.bodySmall!.copyWith(
        color: theme.palette.textTertiary,
      ),
      onChanged: onChanged,
    );
  }
}
