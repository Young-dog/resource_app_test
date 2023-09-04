import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../widgets/widgets.dart';

class TaskerView extends StatelessWidget {
  const TaskerView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
        ),
        child: Column(
          children: [
            const FilterCalendar(),
            Container(
              child: const Text('Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
