import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class SocialMenu extends StatelessWidget {
  const SocialMenu({super.key});

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
      child: ButtonSettings(
        onPressed: () {},
        title: 'Друзья',
      ),
    );
  }
}
