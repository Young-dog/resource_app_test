import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app/themes/themes.dart';

class FieldInput extends StatelessWidget {
  const FieldInput({
    this.labelText = '',
    this.numLines = 1,
    this.autoFocus = false,
    this.obscureText = false,
    this.initialValue,
    this.labelStyle,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.onSubmit,
    this.hintText,
    this.controller,
    this.autofillHints,
    this.suffixIcon,
    this.suffix,
    this.style,
    super.key,
  });

  final String? initialValue;
  final String labelText;
  final TextStyle? labelStyle;
  final int? numLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmit;
  final String? hintText;
  final TextEditingController? controller;
  final List<String>? autofillHints;
  final bool obscureText;
  final bool autoFocus;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40,
      child: TextFormField(
        style: style,
        controller: controller,
        autofillHints: autofillHints,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        cursorColor: theme.palette.textTertiary,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        initialValue: initialValue,
        autofocus: autoFocus,
        minLines: numLines,
        maxLines: numLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffix: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(theme.radiuses.x2),
            borderSide: BorderSide(
              color: theme.palette.borderSecondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(theme.radiuses.x2),
            borderSide: BorderSide(
              color: theme.palette.borderPrimary,
            ),
          ),
          labelStyle: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}
