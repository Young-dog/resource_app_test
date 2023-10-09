import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../../data/data.dart';
import '../../../../../presentation.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late TextEditingController _controller;

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
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TaskTitleInput(
              onChanged: (value) {
                context
                    .read<TaskBloc>()
                    .add(AddTitleTaskEvent(title: value));
              },
            ),
            Subtasks(
              changeTasks: _changeTasks,
              subtasks: state.subtasks,
              onPressed: _addTask,
              controller: _controller,
            ),
            TaskNote(
              onChanged: (value) {
                context.read<TaskBloc>().add(AddNoteEvent(note: value));
              },
            ),
            SizedBox(
              height: theme.spacings.x4,
            ),
          ],
        );
      },
    );
  }

  void _addTask({
    required String? name,
    required bool value,
  }) {
    if (name != null && name.isNotEmpty) {
      context.read<TaskBloc>().add(AddSubtaskEvent(title: name, finish: value));
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

    context
        .read<TaskBloc>()
        .add(ChangeSubtasksEvent(subtask: subtask, index: index));
  }
}
