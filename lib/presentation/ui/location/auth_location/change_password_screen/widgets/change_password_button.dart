import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../presentation.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      child: Text(
        S.of(context).changePaswordButtonTitle,
      ),
    );
  }
}
