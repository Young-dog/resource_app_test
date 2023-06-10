import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../posts/post_screen.dart';
import '../../profile/profile_screen.dart';
import '../../reels/reels_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const PostsScreen(),
        const ReelsScreen(),
        const ProfileScreen(),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/reels.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 45,
            height: 45,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xFF131515),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6,
    );
  }
}
