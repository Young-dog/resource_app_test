import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class SubmitVerificationButton extends StatelessWidget {
  const SubmitVerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        context.read<LogInBloc>().add(const ReSubmitVerificationEvent());
      },
      child: Text(
        S.of(context).reSubmitTitle,
      ),
    );
  }
}
