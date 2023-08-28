import 'package:flutter/material.dart';

class Radiuses extends ThemeExtension<Radiuses> {
  const Radiuses({
    required this.x1,
    required this.x2,
    required this.x3,
    required this.x4,
    required this.x5,
    required this.x6,
    required this.x8,
    required this.x10,
  });

  const Radiuses.regular()
      : this(
          x1: const Radius.circular(4),
          x2: const Radius.circular(8),
          x3: const Radius.circular(12),
          x4: const Radius.circular(16),
          x5: const Radius.circular(20),
          x6: const Radius.circular(24),
          x8: const Radius.circular(32),
          x10: const Radius.circular(40),
        );

  final Radius x1;
  final Radius x2;
  final Radius x3;
  final Radius x4;
  final Radius x5;
  final Radius x6;
  final Radius x8;
  final Radius x10;

  @override
  Radiuses copyWith({
    Radius? x1,
    Radius? x2,
    Radius? x3,
    Radius? x4,
    Radius? x5,
    Radius? x6,
    Radius? x8,
    Radius? x10,
  }) {
    return Radiuses(
      x1: x1 ?? this.x1,
      x2: x2 ?? this.x2,
      x3: x3 ?? this.x3,
      x4: x4 ?? this.x4,
      x5: x5 ?? this.x5,
      x6: x6 ?? this.x6,
      x8: x8 ?? this.x8,
      x10: x10 ?? this.x10,
    );
  }

  @override
  ThemeExtension<Radiuses> lerp(ThemeExtension<Radiuses>? other, double t) {
    if (other is! Radiuses) {
      return this;
    }

    return Radiuses(
      x1: Radius.lerp(x1, other.x1, t)!,
      x2: Radius.lerp(x2, other.x2, t)!,
      x3: Radius.lerp(x3, other.x3, t)!,
      x4: Radius.lerp(x4, other.x4, t)!,
      x5: Radius.lerp(x5, other.x5, t)!,
      x6: Radius.lerp(x6, other.x6, t)!,
      x8: Radius.lerp(x8, other.x8, t)!,
      x10: Radius.lerp(x10, other.x10, t)!,
    );
  }
}
