import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';

class TitleTask extends StatelessWidget {
  const TitleTask({
    required this.title,
    required this.level,
    required this.finish,
    super.key,
  });

  final String title;
  final LevelImportance? level;
  final bool finish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.bodySmall!.copyWith(
              color: finish ? theme.palette.textTertiary : theme.palette.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              decoration: finish ? TextDecoration.lineThrough : null,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        if (level != null)
          Icon(
            Icons.warning_amber_rounded,
            color: level!.color,
          ),
      ],
    );
  }
}
