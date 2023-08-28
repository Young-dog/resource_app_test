import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return PrimaryButton(
          onPressed: !state.formStatusFirst.isValidated ? null : () {
            context.read<ResetPasswordBloc>().add(
                const SubmitEmailResetPasswordEvent());
          },
          child: Text(
            S
                .of(context)
                .submitResetPassButtonTitle,
          ),
        );
      },
    );
  }
}
