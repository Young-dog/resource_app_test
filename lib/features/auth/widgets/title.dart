import 'package:flutter/material.dart';

class TitleForApp extends StatefulWidget {
  final TextStyle theme;

  const TitleForApp({
    required this.theme,
    super.key,
  });

  @override
  State<TitleForApp> createState() => _TitleForAppState();
}

class _TitleForAppState extends State<TitleForApp> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Resourse',
      style: widget.theme,
    );
  }
}
