import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class ButtonSettings extends StatelessWidget {
  const ButtonSettings({
    required this.onPressed,
    required this.title,
    this.color,
    super.key,
  });

  final void Function()? onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          theme.radiuses.x4,
        ),
        color: theme.palette.textSecondary.withOpacity(0.5),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 14,
                color: color ?? theme.palette.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: color ?? theme.palette.iconPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
