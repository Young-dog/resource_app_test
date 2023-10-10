import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    required this.onChanged,
    required this.icon,
    required this.title,
    this.color,
    super.key,
  });

  final String icon;
  final String title;
  final Color? color;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onChanged,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: theme.spacings.x13,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x2,
          vertical: theme.spacings.x4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: color == null ? theme.palette.borderPrimary : color!,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            theme.radiuses.x2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: theme.spacings.x6,
              color: color == null ? theme.palette.iconPrimary : color!,
            ),
            SizedBox(
              width: theme.spacings.x2,
            ),
            Text(
              title,
              style: theme.textTheme.bodySmall!.copyWith(
                color: color == null ? theme.palette.textPrimary : color!,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              color: color == null ? theme.palette.iconPrimary : color!,
            )
          ,],
        ),
      ),
    );
  }
}
