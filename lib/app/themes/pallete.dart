import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.bgPrimary,
    required this.buttonPrimary,
    required this.textPrimary,
    required this.iconPrimary,
    required this.textSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.textTertiary,
    required this.buttonSecondary,
  });

  const Palette.dark()
      : this(
          // Background
          bgPrimary: const Color(0xFF131515),
          // Button
          buttonPrimary: const Color(0xFFffffff),
          buttonSecondary: const Color(0xff0000ffff),
          //Text
          textPrimary: const Color(0xFFffffff),
          textSecondary: const Color(0xFF000000),
          textTertiary: const Color(0xFF6c757d),
          //Icon
          iconPrimary: const Color(0xFFffffff),
          //Border
          borderPrimary: const Color(0xFFffffff),
          borderSecondary: const Color(0xFF6c757d),
        );

  // Background
  final Color bgPrimary;

  // Button
  final Color buttonPrimary;
  final Color buttonSecondary;

  //Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  //Icon
  final Color iconPrimary;

  //Border
  final Color borderPrimary;
  final Color borderSecondary;

  @override
  Palette copyWith({
    Color? bgPrimary,
    Color? buttonPrimary,
    Color? textPrimary,
    Color? iconPrimary,
    Color? textSecondary,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? textTertiary,
    Color? buttonSecondary,
  }) {
    return Palette(
      // Background
      bgPrimary: bgPrimary ?? this.bgPrimary,
      // Button
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      //Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      //Icon
      iconPrimary: iconPrimary ?? this.iconPrimary,
      //Border
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
    );
  }

  @override
  ThemeExtension<Palette> lerp(ThemeExtension<Palette>? other, double t) {
    if (other is! Palette) {
      return this;
    }

    return Palette(
      // Background
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      // Button
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      //Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      //Icon
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      //Border
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
    );
  }
}
