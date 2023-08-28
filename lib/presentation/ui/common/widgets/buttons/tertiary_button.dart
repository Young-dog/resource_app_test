import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
