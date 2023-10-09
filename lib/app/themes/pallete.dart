import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.bgPrimary,
    required this.bgSecondary,
    required this.buttonPrimary,
    required this.textPrimary,
    required this.iconPrimary,
    required this.textSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.textTertiary,
    required this.buttonSecondary,
    required this.iconSecondary,
    required this.bottomBarElevation,
    required this.buttonAccent,
    required this.buttonShare,
    required this.buttonCheck,
    required this.buttonTertiary,
  });

  const Palette.dark()
      : this(
          // Background
          bgPrimary: const Color(0xFF131515),
          bgSecondary: const Color(0xFFFFFFFF),
          // Button
          buttonPrimary: const Color(0xFFffffff),
          buttonSecondary: const Color(0xff0000ffff),
          buttonAccent: const Color(0xFFd00000),
          buttonShare: const Color(0xFF0077b6),
          buttonCheck: const Color(0xFF008000),
          buttonTertiary: const Color(0xFF6c757d),
          //Text
          textPrimary: const Color(0xFFffffff),
          textSecondary: const Color(0xFF000000),
          textTertiary: const Color(0xFF6c757d),
          //Icon
          iconPrimary: const Color(0xFFffffff),
          iconSecondary: const Color(0xFF6c757d),
          //Border
          borderPrimary: const Color(0xFFffffff),
          borderSecondary: const Color(0xFF6c757d),
          //Elevation
          bottomBarElevation: const Color(0xFF0a0908),
        );

  const Palette.light()
      : this(
          // Background
          bgPrimary: const Color(0xFF131515),
          bgSecondary: const Color(0xFFFFFFFF),
          // Button
          buttonPrimary: const Color(0xFFffffff),
          buttonSecondary: const Color(0xff0000ffff),
          buttonAccent: const Color(0xFFd00000),
          buttonShare: const Color(0xFF0077b6),
          buttonCheck: const Color(0xFF008000),
          buttonTertiary: const Color(0xFF6c757d),
          //Text
          textPrimary: const Color(0xFFffffff),
          textSecondary: const Color(0xFF000000),
          textTertiary: const Color(0xFF6c757d),
          //Icon
          iconPrimary: const Color(0xFFffffff),
          iconSecondary: const Color(0xFF6c757d),
          //Border
          borderPrimary: const Color(0xFFffffff),
          borderSecondary: const Color(0xFF6c757d),
          //Elevation
          bottomBarElevation: const Color(0xFF0a0908),
        );

  // Background
  final Color bgPrimary;
  final Color bgSecondary;

  // Button
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color buttonTertiary;
  final Color buttonAccent;
  final Color buttonShare;
  final Color buttonCheck;

  //Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  //Icon
  final Color iconPrimary;
  final Color iconSecondary;

  //Border
  final Color borderPrimary;
  final Color borderSecondary;

  //Elevation
  final Color bottomBarElevation;

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
    Color? iconSecondary,
    Color? bottomBarElevation,
    Color? buttonAccent,
    Color? bgSecondary,
    Color? buttonShare,
    Color? buttonCheck,
    Color? buttonTertiary,
  }) {
    return Palette(
      // Background
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      // Button
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonAccent: buttonAccent ?? this.buttonAccent,
      buttonShare: buttonShare ?? this.buttonShare,
      buttonCheck: buttonCheck ?? this.buttonCheck,
      buttonTertiary: buttonTertiary ?? this.buttonTertiary,
      //Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      //Icon
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      //Border
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      //Elevation
      bottomBarElevation: bottomBarElevation ?? this.bottomBarElevation,
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
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      // Button
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      buttonAccent: Color.lerp(buttonAccent, other.buttonAccent, t)!,
      buttonShare: Color.lerp(buttonShare, other.buttonShare, t)!,
      buttonCheck: Color.lerp(buttonCheck, other.buttonCheck, t)!,
      buttonTertiary: Color.lerp(buttonTertiary, other.buttonTertiary, t)!,
      //Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      //Icon
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      //Border
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      //Elevation
      bottomBarElevation:
          Color.lerp(bottomBarElevation, other.bottomBarElevation, t)!,
    );
  }
}
