import 'package:flutter/material.dart';

import '../../bottom_navigation_bar/view/bottom_nav_bar.dart';

class ReelsScreen extends StatelessWidget {
  static const String id = 'reels_screen';
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
