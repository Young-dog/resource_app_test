import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => TaskBloc(taskRepository: GetIt.instance()),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x8,
          vertical: theme.spacings.x20 * 3,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(theme.spacings.x3),
            decoration: BoxDecoration(
              border: Border.all(color: theme.palette.borderSecondary),
              borderRadius: BorderRadius.circular(theme.spacings.x4),
              color: theme.palette.bgPrimary,
            ),
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      size: 0,
                      color: theme.palette.buttonPrimary,
                    ),
                    toolbarHeight: theme.spacings.x8,
                    actions: [
                      if (state.title.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            context
                                .read<TaskBloc>()
                                .add(const AddLocalTaskEvent());
                            Navigator.of(context).pop();
                          },
                          iconSize: theme.spacings.x6,
                          icon: Icon(
                            Icons.add_circle,
                            color: theme.palette.buttonPrimary,
                          ),
                        ),
                    ],
                  ),
                  body: const AddTaskView(),
                  bottomNavigationBar: const BottomAddTaskBar(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
