import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  final PageController pageController;
  const BottomNavBar({required this.pageController, Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 0 ? Colors.white : Colors.black,
                    BlendMode.srcIn),
                width: 45,
                height: 45,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/reels.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 1 ? Colors.white : Colors.black,
                    BlendMode.srcIn),
                width: 45,
                height: 45,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 2 ? Colors.white : Colors.black,
                    BlendMode.srcIn),
                width: 45,
                height: 45,
              ),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
          selectedFontSize: 0,
        ),
      ),
    );
  }
}
