import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../data/data.dart';
import '../../../../../presentation.dart';
import '../widgets/datetime_task.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    required this.index,
    super.key,
  });

  final int index;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              TaskTitleInput(
                onChanged: (value) {
                  context.read<TaskBloc>().add(
                        ChangeTaskTitleEvent(
                          title: value,
                          index: widget.index,
                        ),
                      );
                },
                initialValue: state.title,
              ),
              SizedBox(
                height: theme.spacings.x4,
              ),
              Subtasks(
                subtasks: state.subtasks,
                onPressed: _addTask,
                changeTasks: _changeTasks,
                controller: _controller,
              ),
              SizedBox(
                height: theme.spacings.x4,
              ),
              TaskNote(
                onChanged: (value) {
                  context.read<TaskBloc>().add(
                        ChangeTaskNoteEvent(
                          note: value,
                          index: widget.index,
                        ),
                      );
                },
                initialValue: state.note,
              ),
              SizedBox(
                height: theme.spacings.x4,
              ),
              if (state.category != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: CategoriesMenu(
                    onChanged: (value) {
                      context.read<TaskBloc>().add(
                            ChangeTaskCategoryEvent(
                              category: value,
                              index: widget.index,
                            ),
                          );
                    },
                    value: state.category,
                  ),
                ),
              SizedBox(
                height: theme.spacings.x4,
              ),
              if (state.level != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: LevelImportanceMenu(
                    value: state.level,
                    onChanged: (value) {
                      context.read<TaskBloc>().add(
                            ChangeTaskLevelEvent(
                              level: value,
                              index: widget.index,
                            ),
                          );
                    },
                  ),
                ),
              SizedBox(
                height: theme.spacings.x4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: DateTimeTask(
                  dateFirst: state.dateFirst,
                  dateSecond: state.dateSecond,
                  onChangedDateSecond: (value) {
                    context.read<TaskBloc>().add(
                          ChangeTaskDateSecondEvent(
                            date: value,
                            index: widget.index,
                          ),
                        );
                  },
                  onChangedDateFirst: (value) {
                    context.read<TaskBloc>().add(
                          ChangeTaskDateFirstEvent(
                            date: value,
                            index: widget.index,
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTask({
    required String? name,
    required bool value,
  }) {
    if (name != null && name.isNotEmpty) {
      context.read<TaskBloc>().add(
            ChangeTaskSubtasksAddEvent(
              title: name,
              finish: value,
              index: widget.index,
            ),
          );
      _controller.clear();
      setState(() {});
    }
  }

  void _changeTasks({
    required List<SubtaskRequestDto> subtasks,
    required int index,
    required String? name,
    required bool? value,
  }) {
    final subtask = SubtaskRequestDto(
      title: name ?? subtasks[index].title,
      finish: value ?? subtasks[index].finish,
    );

    context.read<TaskBloc>().add(
          ChangeTaskSubtasksEvent(
            subtask: subtask,
            index: index,
            indexTask: widget.index,
          ),
        );
  }
}
