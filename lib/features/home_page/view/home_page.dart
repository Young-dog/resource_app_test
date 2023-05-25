import 'package:flutter/material.dart';
import 'package:resourse_app/features/profile/view/profile_screen.dart';
import 'package:resourse_app/features/reels/view/reels_screen.dart';

import '../../bottom_nav_bar/view/bottom_nav_bar.dart';
import '../../posts/view/posts_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('username'),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          PostsScreen(),
          ReelsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(pageController: _pageController,),
    );
  }
}
