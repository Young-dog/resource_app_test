import 'package:flutter/material.dart';
import '../../../../presentation.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    required this.labelText,
    this.onChanged,
    this.textEditingController,
    super.key,
  });

  final String labelText;
  final void Function(String value)? onChanged;
  final TextEditingController? textEditingController;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FieldInput(
      style: theme.textTheme.labelLarge,
      labelText: widget.labelText,
      obscureText: _obscurePassword,
      onChanged: widget.onChanged,
      suffixIcon: ObscurePasswordButton(
        obscurePassword: _obscurePassword,
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      controller: widget.textEditingController,
    );
  }
}
