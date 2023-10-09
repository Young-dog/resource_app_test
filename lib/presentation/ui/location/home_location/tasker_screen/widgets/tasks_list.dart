import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../app/app.dart';
import '../../../../../../data/data.dart';
import '../../../../../presentation.dart';
import 'widgets.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerBloc, TaskerState>(
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable:
              Hive.box<TaskRequestDto>(HiveBoxes.tasksBox).listenable(),
          builder: (context, box, _) {
            if (box.values.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Not Tasks'),
                ),
              );
            }

            return BlocBuilder<TaskerBloc, TaskerState>(
              builder: (context, state) {
                final tasks = box.values.toList();

                final taskEdited = tasks
                    .where(
                      (element) =>
                          (element.dateFirst?.day == state.selectedDate.day &&
                              element.dateFirst?.month ==
                                  state.selectedDate.month &&
                              element.dateFirst?.year ==
                                  state.selectedDate.year) ||
                          (element.dateFirst == null &&
                              (state.selectedDate.day == DateTime.now().day &&
                                  state.selectedDate.month ==
                                      DateTime.now().month &&
                                  state.selectedDate.year ==
                                      DateTime.now().year)) ||
                          (element.dateFirst?.compareTo(state.selectedDate) ==
                                  -1 &&
                              (state.selectedDate.day == DateTime.now().day &&
                                  state.selectedDate.month ==
                                      DateTime.now().month &&
                                  state.selectedDate.year ==
                                      DateTime.now().year)),
                    )
                    .toList();
                return SliverList.builder(
                  itemCount: taskEdited.length,
                  itemBuilder: (context, index) {
                    final task = taskEdited.elementAt(index);
                    return TaskCard(
                      task: task,
                      index: tasks.indexOf(task),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
