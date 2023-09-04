import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        context.read<SignUpBloc>().add(const SignUpSubmitEvent());
      },
      child: Text(
        S.of(context).signUpButtonTitle,
      ),
    );
  }
}
