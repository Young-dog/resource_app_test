import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () async {
        context.read<LogInBloc>().add(const LogInWithGoogleEvent());
      },
      child: Text(
        S.of(context).signInWithgoogleButtonTitle,
      ),
    );
  }
}
