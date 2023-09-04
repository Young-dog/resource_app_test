import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _pages = [
    const TaskerScreen(),
    const CalendarScreen(),
    const ChatsScreen(),
    const SettingsScreen(),
  ];

  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: const SideHomeMenu(),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pages,
          ),
          Positioned(
            bottom: theme.spacings.x3,
            child: BottomNavBar(
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}

/*
AutoTabsScaffold(
      backgroundColor: theme.palette.bgPrimary,
      routes: const [
        TaskerRoute(),
        CalendarRoute(),
        ChatsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: 'Tasks',
              icon: Icon(Icons.add),
              backgroundColor: theme.palette.bgPrimary,
            ),
            BottomNavigationBarItem(
              label: 'Calendar',
              icon: Icon(Icons.ac_unit),
              backgroundColor: theme.palette.bgPrimary,),
            BottomNavigationBarItem(
              label: 'Chats',
              icon: Icon(Icons.access_alarm),
              backgroundColor: theme.palette.bgPrimary,),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.accessibility_new),
                backgroundColor: theme.palette.bgPrimary,),
          ],
        );
      },
    );

 */
