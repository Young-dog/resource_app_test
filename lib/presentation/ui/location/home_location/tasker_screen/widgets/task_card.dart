

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../data/data.dart';
import '../../../../../presentation.dart';
import 'widgets.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    required this.task,
    required this.index,
    super.key,
  });

  final TaskRequestDto task;
  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  double _xOffset = 0.0;

  bool _isShadow = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<TaskerBloc, TaskerState>(
      listener: (context, state) {
        if (state.status.isFinish) {

          _isShadow = false;
          setState(() {
          });
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.router.push(
              TaskRoute(
                task: widget.task,
                index: widget.index,
              ),
            );
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            setState(() {
              _xOffset += details.delta.dx;
            });
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            setState(() {
              _xOffset = 0.0;
              _isShadow = !_isShadow;
              if (_isShadow) {
                context.read<TaskerBloc>().add(
                      AddToListTaskEvent(
                        index: widget.index,
                      ),
                    );
              } else {
                context.read<TaskerBloc>().add(
                      DelToListTaskEvent(
                        index: widget.index,
                      ),
                    );
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(_xOffset, 0.0, 0.0),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: theme.spacings.x6,
                vertical: theme.spacings.x3,
              ),
              padding: EdgeInsets.only(
                right: theme.spacings.x4,
                left: theme.spacings.x4,
                top: theme.spacings.x2,
                bottom: theme.spacings.x4,
              ),
              decoration: BoxDecoration(
                color: theme.palette.textSecondary.withOpacity(0.5),
                borderRadius: BorderRadius.all(theme.radiuses.x4),
                boxShadow: _isShadow
                    ? [
                        BoxShadow(
                          color: theme.palette.buttonPrimary,
                          offset: const Offset(0, 6),
                          blurRadius: 6,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTask(
                    title: widget.task.title,
                    level: widget.task.level,
                    finish: widget.task.finish,
                  ),
                  SizedBox(
                    height: theme.spacings.x1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.task.category != null)
                        CategoriesMenu(
                          value: widget.task.category,
                          onTap: false,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
