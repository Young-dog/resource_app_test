import 'package:flutter/material.dart';
import 'themes.dart';

abstract class ThemeBuilder {
  const ThemeBuilder();

  ThemeData build({
    Radiuses radiuses = const Radiuses.regular(),
    Spacings spacings = const Spacings.regular(),
  });
}
