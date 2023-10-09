import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/app.dart';
import '../../../../../app/asset_names.dart';
import '../../../../presentation.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final wh = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return SafeArea(
      child: SizedBox(
        width: wh,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x6,
          ),
          child: BlocBuilder<TaskerBloc, TaskerState>(
            builder: (context, state) {
              if (state.indexes.isNotEmpty) {
                return const _ActionTasks();
              }

              if (state.indexes.isNotEmpty) {
                return _ReplaceScreen(
                  pageController: pageController,
                );
              }

              return _ReplaceScreen(
                pageController: pageController,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ActionTasks extends StatelessWidget {
  const _ActionTasks();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TaskerBloc, TaskerState>(
      builder: (context, state) {
        return Row(
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
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<TaskerBloc>().add(const FinishTaskEvent());
                    },
                    icon: Icon(
                      Icons.check,
                      color: theme.palette.buttonCheck,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<TaskerBloc>().add(const DelTasksEvent());
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: theme.palette.buttonAccent,
                    ),
                  ),
                  if (state.indexes.length < 2)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: theme.palette.buttonShare,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ReplaceScreen extends StatelessWidget {
  const _ReplaceScreen({
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  pageController.jumpToPage(
                    0,
                  );
                },
                icon: SvgPicture.asset(
                  AssetNames.tasksIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  pageController.jumpToPage(
                    1,
                  );
                },
                icon: SvgPicture.asset(
                  AssetNames.calendarIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  pageController.jumpToPage(
                    2,
                  );
                },
                icon: SvgPicture.asset(
                  AssetNames.chatIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  pageController.jumpToPage(
                    3,
                  );
                },
                icon: SvgPicture.asset(
                  AssetNames.settingsIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: theme.spacings.x6,
        ),
        ClipOval(
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddTaskScreen();
                },
              );
            },
            backgroundColor: theme.palette.buttonPrimary,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
