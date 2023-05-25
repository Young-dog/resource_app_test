import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontFamily: "BrunoAceSC",
      fontSize: 25,
    ),
    titleMedium: TextStyle(
      fontFamily: "BrunoAceSC",
      fontSize: 35,
    ),
    labelSmall: TextStyle(
      fontFamily: "Caveat",
      fontSize: 15,
    ),
    labelMedium: TextStyle(
      fontFamily: "Ysabeau",
      fontSize: 15,
      color: Colors.black87,
      fontWeight: FontWeight.w400
    ),
  )
);