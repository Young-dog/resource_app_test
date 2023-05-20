import 'package:flutter/material.dart';
import 'package:resourse_app/features/sign_in_screen/sign_in.dart';
import 'package:resourse_app/theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const SignInScreen(),
    );
  }
}