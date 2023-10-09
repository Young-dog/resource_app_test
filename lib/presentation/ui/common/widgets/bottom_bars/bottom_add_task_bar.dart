import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../../data/data.dart';
import '../../../../presentation.dart';

class BottomAddTaskBar extends StatelessWidget {
  const BottomAddTaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wh = MediaQuery.of(context).size.width;

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return SizedBox(
          width: wh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LevelImportanceMenu(
                value: state.level,
                onChanged: (value) {
                  context.read<TaskBloc>().add(AddLevelTaskEvent(level: value));
                },
              ),
              CategoriesMenu(
                onChanged: (CategoryTaskRequestDto value) {
                  context.read<TaskBloc>().add(
                        AddCategoryTaskEvent(
                          category: value,
                        ),
                      );
                },
                value: state.category,
              ),
              NotifyButton(
                isNotify: state.notify,
                onChange: (DateTime? value) {
                  context.read<TaskBloc>().add(AddNotifyEvent(notify: value));
                },
                recurring: state.isRecurring,
                onTimerDurationChanged: (Duration? value) {
                },
                time: state.time,
              ),
              if (state.isRecurring.isEmpty)
                DateTermTask(
                  date: state.dateFirst,
                  onPressedSaveDate: (value) {
                    context
                        .read<TaskBloc>()
                        .add(AddDateFirstEvent(date: value));
                  },
                ),
              if (state.dateFirst != null)
                Icon(
                  Icons.navigate_next_rounded,
                  color: theme.palette.buttonPrimary,
                ),
              if (state.dateFirst != null)
                DateTermTask(
                  date: state.dateSecond,
                  onPressedSaveDate: (value) {
                    context
                        .read<TaskBloc>()
                        .add(AddDateSecondEvent(date: value));
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
