import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:resourse_app/features/profile/view/profile_screen.dart';
import 'package:resourse_app/features/reels/view/reels_screen.dart';
import '../../posts/view/posts_screen.dart';

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
      backgroundColor: Colors.black,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black54,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
