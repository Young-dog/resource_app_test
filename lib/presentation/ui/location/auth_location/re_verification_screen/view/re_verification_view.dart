import 'package:flutter/material.dart';
import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';
import '../widgets/widgets.dart';

class ReVerificationView extends StatelessWidget {
  const ReVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: theme.spacings.x4,
        ),
        Text(
          S.of(context).reVerificationDescription,
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(
          height: theme.spacings.x4,
        ),
        const SubmitVerificationButton(),
      ],
    );
  }
}
