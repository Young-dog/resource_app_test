import 'package:flutter/material.dart';

import '../../bottom_navigation_bar/view/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('username'),
      ),
      body: const SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
