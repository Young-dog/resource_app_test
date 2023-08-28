import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../app/router/router.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../ui.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        context.router.push(const SignUpRoute());
      },
      child: Text(
        S.of(context).signUpButtonTitle,
      ),
    );
  }
}
