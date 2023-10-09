import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Настройки',
          style: theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              theme.radiuses.x4,
            ),
            color: theme.palette.textSecondary.withOpacity(0.5),
          ),
          child: Column(
            children: [
              ButtonSettings(
                onPressed: () {},
                title: 'Основные',
              ),
              ButtonSettings(
                onPressed: () {},
                title: 'Оформление',
              ),
              ButtonSettings(
                onPressed: () {},
                title: 'Конфиденциальность',
              ),
              ButtonSettings(
                onPressed: () {},
                title: 'Уведомления',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
