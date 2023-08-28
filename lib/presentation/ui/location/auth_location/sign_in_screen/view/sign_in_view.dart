import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../resourse_app.dart';
import '../widgets/widgets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            S.of(context).titleApp,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: theme.spacings.x9,
          ),
          EmailInput(
            onChanged: (value) {
              context
                  .read<LogInBloc>()
                  .add(EmailInputSignInEvent(value: value));
            },
          ),
          SizedBox(
            height: theme.spacings.x4,
          ),
          PasswordInput(
            labelText: S.of(context).passwordLabel,
            onChanged: (value) {
              context.read<LogInBloc>().add(PasswordInputEvent(value: value));
            },
          ),
          SizedBox(
            height: theme.spacings.x2,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: ResetPasswordButton(),
          ),
          SizedBox(
            height: theme.spacings.x2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SignInButton(),
              SizedBox(
                width: theme.spacings.x5,
              ),
              const SignInWithGoogleButton(),
            ],
          ),
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
          const SignUpButton(),
        ],
      ),
    );
  }
}
