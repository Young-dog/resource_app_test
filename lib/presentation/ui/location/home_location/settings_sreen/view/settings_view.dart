import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.spacings.x6,
        horizontal: theme.spacings.x4,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileButton(),
          SizedBox(
            height: theme.spacings.x10,
          ),
          const SocialMenu(),
          SizedBox(
            height: theme.spacings.x10,
          ),
          const SettingsMenu(),
          SizedBox(
            height: theme.spacings.x10,
          ),
          const FeedbackMenu(),
          SizedBox(
            height: theme.spacings.x10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                theme.radiuses.x4,
              ),
              color: theme.palette.textSecondary.withOpacity(0.5),
            ),
            child: ButtonSettings(
              onPressed: () {
                context.read<LogInBloc>().add(const LogOutEvent());
              },
              title: 'Выйти',
              color: theme.palette.buttonAccent,
            ),
          ),
          SizedBox(
            height: theme.spacings.x20 * 2,
          ),
        ],
      ),
    );
  }
}
