import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {

        return PrimaryButton(
          onPressed: () {
            context.read<SignUpBloc>().add(const InputPasswordEvent());
          },
          child: Text(
            S.of(context).continueButtonTitle,
          ),
        );
      },
    );
  }
}
