import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class TaskScreen extends StatelessWidget {
  const TaskScreen({
    required this.task,
    required this.index,
    super.key,
  });

  final TaskRequestDto task;

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => TaskBloc(
        taskRepository: GetIt.instance(),
        title: task.title,
        subtasks: task.subtasks,
        dateFirst: task.dateFirst,
        dateSecond: task.dateSecond,
        level: task.level,
        note: task.note,
        notify: task.notify,
        category: task.category,
        finish: task.finish,
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x4,
          ),
          child: TaskView(
            index: index,
          ),
        ),
        bottomNavigationBar: TaskBottomBar(
          index: index,
        ),
      ),
    );
  }
}
