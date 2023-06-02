import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  static const String id = 'reels_screen';
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Reels')),
    );
  }
}
