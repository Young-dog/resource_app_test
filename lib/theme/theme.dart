import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
  ),
  scaffoldBackgroundColor: Colors.black,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontFamily: "Ysabeau",
      fontSize: 15,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: "BrunoAceSC",
      fontSize: 25,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: "BrunoAceSC",
      fontSize: 35,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: "Caveat",
      fontSize: 15,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: "Ysabeau",
      fontSize: 15,
      color: Colors.black87,
      fontWeight: FontWeight.w400
    ),
  )
);