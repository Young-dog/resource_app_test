import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resourse_app/features/home_page/view/home_page.dart';
import 'package:resourse_app/features/profile/view/profile_screen.dart';
import 'package:resourse_app/features/reels/view/reels_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: const BoxDecoration(
          color: Colors.transparent,
         border: Border(
           top: BorderSide(
             color: Colors.grey,
             width: 0.5,
           ),
         ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/home.svg'))
            ],
          ),
        ),
    );
  }
}
