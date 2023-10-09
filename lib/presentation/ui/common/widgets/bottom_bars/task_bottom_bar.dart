import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

class TaskBottomBar extends StatelessWidget {
  const TaskBottomBar({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.x6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.spacings.x4,
                  vertical: theme.spacings.x2,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: theme.palette.bottomBarElevation,
                      offset: const Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(theme.radiuses.x8),
                ),
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        if (state.level == null)
                          LevelImportanceMenu(
                            value: state.level,
                            onChanged: (value) {
                              context.read<TaskBloc>().add(
                                    ChangeTaskLevelEvent(
                                      level: value,
                                      index: index,
                                    ),
                                  );
                            },
                          ),
                        if (state.category == null)
                          CategoriesMenu(
                            onChanged: (value) {
                              context.read<TaskBloc>().add(
                                    ChangeTaskCategoryEvent(
                                      category: value,
                                      index: index,
                                    ),
                                  );
                            },
                            value: state.category,
                          ),
                        NotifyButton(
                          isNotify: state.notify,
                          onChange: (DateTime? value) {
                            context.read<TaskBloc>().add(
                                  ChangeTaskNotifyEvent(
                                    notify: value,
                                    index: index,
                                  ),
                                );
                          },
                          recurring: state.isRecurring,
                          onTimerDurationChanged: (Duration? value) {},
                          time: state.time,
                        ),
                        if (state.dateFirst == null &&
                            state.isRecurring.isEmpty)
                          DateTermTask(
                            date: state.dateFirst,
                            onPressedSaveDate: (value) {
                              context.read<TaskBloc>().add(
                                    ChangeTaskDateFirstEvent(
                                      date: value,
                                      index: index,
                                    ),
                                  );
                            },
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
