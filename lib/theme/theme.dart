import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
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
      fontSize: 20,
      color: Colors.black87,
      fontWeight: FontWeight.w400
    ),
  )
);