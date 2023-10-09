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
    required this.x13,
    required this.x14,
    required this.x15,
    required this.x16,
    required this.x17,
    required this.x18,
    required this.x19,
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
          x13: 39,
          x14: 42,
          x15: 45,
          x16: 48,
          x17: 51,
          x18: 54,
          x19: 57,
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
          x13: 52,
          x14: 56,
          x15: 60,
          x16: 64,
          x17: 68,
          x18: 72,
          x19: 76,
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
  final double x13;
  final double x14;
  final double x15;
  final double x16;
  final double x17;
  final double x18;
  final double x19;
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
    double? x13,
    double? x14,
    double? x15,
    double? x16,
    double? x17,
    double? x18,
    double? x19,
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
      x13: x13 ?? this.x13,
      x14: x14 ?? this.x14,
      x15: x15 ?? this.x15,
      x16: x16 ?? this.x16,
      x17: x17 ?? this.x17,
      x18: x18 ?? this.x18,
      x19: x19 ?? this.x19,
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
      x13: lerpDouble(x13, other.x13, t)!,
      x14: lerpDouble(x14, other.x14, t)!,
      x15: lerpDouble(x15, other.x15, t)!,
      x16: lerpDouble(x16, other.x16, t)!,
      x17: lerpDouble(x17, other.x17, t)!,
      x18: lerpDouble(x18, other.x18, t)!,
      x19: lerpDouble(x19, other.x19, t)!,
      x20: lerpDouble(x20, other.x20, t)!,
    );
  }
}
