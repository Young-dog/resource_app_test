import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'view/tasker_view.dart';

@RoutePage()
class TaskerScreen extends StatelessWidget {
  const TaskerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskerView();
  }
}
