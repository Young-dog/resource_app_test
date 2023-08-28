import 'dart:ui';

import 'package:flutter/material.dart';

class Spacings extends ThemeExtension<Spacings> {
  const Spacings({
    required this.x1,
    required this.x2,
    required this.x3,
    required this.x4,
    required this.x5,
    required this.x6,
    required this.x7,
    required this.x8,
    required this.x9,
    required this.x10,
    required this.x12,
    required this.x15,
    required this.x20,
  });

  const Spacings.small()
      : this(
          x1: 3,
          x2: 6,
          x3: 9,
          x4: 12,
          x5: 15,
          x6: 18,
          x7: 21,
          x8: 24,
          x9: 27,
          x10: 30,
          x12: 36,
          x15: 45,
          x20: 60,
        );

  const Spacings.regular()
      : this(
          x1: 4,
          x2: 8,
          x3: 12,
          x4: 16,
          x5: 20,
          x6: 24,
          x7: 28,
          x8: 32,
          x9: 36,
          x10: 40,
          x12: 48,
          x15: 60,
          x20: 80,
        );

  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final double x5;
  final double x6;
  final double x7;
  final double x8;
  final double x9;
  final double x10;
  final double x12;
  final double x15;
  final double x20;

  @override
  Spacings copyWith({
    double? x1,
    double? x2,
    double? x3,
    double? x4,
    double? x5,
    double? x6,
    double? x7,
    double? x8,
    double? x9,
    double? x10,
    double? x12,
    double? x15,
    double? x20,
  }) {
    return Spacings(
      x1: x1 ?? this.x1,
      x2: x2 ?? this.x2,
      x3: x3 ?? this.x3,
      x4: x4 ?? this.x4,
      x5: x5 ?? this.x5,
      x6: x6 ?? this.x6,
      x7: x7 ?? this.x7,
      x8: x8 ?? this.x8,
      x9: x9 ?? this.x9,
      x10: x10 ?? this.x10,
      x12: x12 ?? this.x12,
      x15: x15 ?? this.x15,
      x20: x20 ?? this.x20,
    );
  }

  @override
  ThemeExtension<Spacings> lerp(ThemeExtension<Spacings>? other, double t) {
    if (other is! Spacings) {
      return this;
    }

    return Spacings(
      x1: lerpDouble(x1, other.x1, t)!,
      x2: lerpDouble(x2, other.x2, t)!,
      x3: lerpDouble(x3, other.x3, t)!,
      x4: lerpDouble(x4, other.x4, t)!,
      x5: lerpDouble(x5, other.x5, t)!,
      x6: lerpDouble(x6, other.x6, t)!,
      x7: lerpDouble(x7, other.x7, t)!,
      x8: lerpDouble(x8, other.x8, t)!,
      x9: lerpDouble(x9, other.x9, t)!,
      x10: lerpDouble(x10, other.x10, t)!,
      x12: lerpDouble(x12, other.x12, t)!,
      x15: lerpDouble(x15, other.x15, t)!,
      x20: lerpDouble(x20, other.x20, t)!,
    );
  }
}
