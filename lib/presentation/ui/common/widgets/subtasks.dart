import 'package:flutter/material.dart';
import '../../../../data/data.dart';
import '../../../presentation.dart';

class Subtasks extends StatelessWidget {
  const Subtasks({
    required this.subtasks,
    required this.onPressed,
    required this.changeTasks,
    required this.controller,
    super.key,
  });

  final List<SubtaskRequestDto> subtasks;
  final void Function({
    required String name,
    required bool value,
  }) onPressed;
  final void Function({
  required List<SubtaskRequestDto> subtasks,
  required int index,
  required String? name,
  required bool? value,
  }) changeTasks;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subtasks.length,
          itemBuilder: (context, index) {
            return SubtaskInput(
              value: subtasks[index].finish,
              name: subtasks[index].title,
              onPressed: ({
                required String name,
                required bool value,
              }) {
                changeTasks(index: index, name: name, value: value, subtasks: subtasks);
              },
            );
          },
        ),
        SubtaskInput(
          controller: controller,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
