import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class TaskerView extends StatelessWidget {
  const TaskerView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TaskerAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: theme.spacings.x4,
            ),
          ),
          const TasksList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: theme.spacings.x20 * 2,
            ),
          ),
        ],
      ),
    );
  }
}

/*
Scaffold(
      //appBar: const TaskerAppBar(),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacings.x4,),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: theme.spacings.x6,),
            const TasksList(),
            SizedBox(height: theme.spacings.x20*2,),
          ],
        ),
      ),
    );
 */
