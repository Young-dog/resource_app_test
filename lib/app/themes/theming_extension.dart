import 'package:flutter/material.dart';
import 'themes.dart';

extension ThemingExtension on ThemeData {
  Palette get palette => extension<Palette>()!;
  Radiuses get radiuses => extension<Radiuses>()!;
  Spacings get spacings => extension<Spacings>()!;
}
