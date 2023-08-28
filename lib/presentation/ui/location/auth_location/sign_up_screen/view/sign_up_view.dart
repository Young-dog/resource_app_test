import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/themes/themes.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        print(state.newPassword);
        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: theme.spacings.x6,
            ),
            EmailInput(
              onChanged: (value) {
                context.read<SignUpBloc>().add(EmailInputSignUpEvent(value: value));
              },
            ),
            SizedBox(
              height: theme.spacings.x4,
            ),
            UsernameInput(
              onChanged: (value) {
                context
                    .read<SignUpBloc>()
                    .add(UsernameInputEvent(value: value));
              },
            ),
            SizedBox(
              height: theme.spacings.x4,
            ),
            const ContinueButton(),
            SizedBox(
              height: theme.spacings.x4,
            ),
            Text(
              S.of(context).orTitle,
              style: theme.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: theme.spacings.x4,
            ),
            const SignUpWithGoogleButton(),
          ],
        );
      },
    );
  }
}
