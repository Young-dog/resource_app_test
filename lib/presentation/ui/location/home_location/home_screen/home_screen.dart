import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = [
    const TaskerScreen(),
    const CalendarScreen(),
    const ChatsScreen(),
    const SettingsScreen(),
  ];

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
