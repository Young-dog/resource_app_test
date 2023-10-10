import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    this.child = const TaskerScreen(),
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const SideHomeMenu(),
      body: Stack(
        children: [
          child,
          Positioned(
            bottom: theme.spacings.x3,
            child: const BottomNavBar(
            ),
          ),
        ],
      ),
    );
  }
}
