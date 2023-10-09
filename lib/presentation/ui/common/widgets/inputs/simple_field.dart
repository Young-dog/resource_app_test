import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app/app.dart';

class SimpleField extends StatelessWidget {
  const SimpleField({
    this.labelText = '',
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
      height: theme.spacings.x10,
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
        maxLines: null,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: theme.textTheme.bodySmall!.copyWith(
            color: theme.palette.textTertiary,
          ),
          suffix: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(theme.radiuses.x4),
            borderSide: BorderSide(color: theme.palette.iconSecondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(theme.radiuses.x4),
            borderSide: BorderSide(color: theme.palette.iconSecondary),
          ),
          labelStyle: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
