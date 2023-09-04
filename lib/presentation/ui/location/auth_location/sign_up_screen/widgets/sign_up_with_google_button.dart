import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  const SignUpWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () {
        context.read<SignUpBloc>().add(
              const SignUpWithGoogleEvent(),
            );
      },
      child: Text(
        S.of(context).signUpWithGoogleButtonTitle,
      ),
    );
  }
}
