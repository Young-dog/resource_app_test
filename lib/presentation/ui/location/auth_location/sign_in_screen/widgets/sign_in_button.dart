import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';
import '../../../../ui.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {

    return PrimaryButton(
      onPressed: () {
        context.read<LogInBloc>().add(const LogInSubmitEvent());
      },
      child: Text(
        S.of(context).signInButtonTitle,
      ),
    );
  }
}
