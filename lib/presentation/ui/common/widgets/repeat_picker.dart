import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class RepeatPicker extends StatefulWidget {
  const RepeatPicker({
    required this.isRecurring,
    required this.onChanged,
    super.key,
  });

  final List<int> isRecurring;
  final void Function(List<int> value) onChanged;

  @override
  State<RepeatPicker> createState() => _RepeatPickerState();
}

class _RepeatPickerState extends State<RepeatPicker> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        _showWeeks(ctx: context);
      },
      icon: Icon(
        Icons.repeat_sharp,
        color:
        widget.isRecurring.isNotEmpty ? theme.palette.buttonPrimary : null,
      ),
    );
  }

  Future<void> _showWeeks({
    required BuildContext ctx,
  }) async {
    final theme = Theme.of(ctx);

    const days = DaysOfWeek.values;

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<TaskBloc>(ctx),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: theme.spacings.x3,
              ),
              constraints: BoxConstraints(
                maxHeight: theme.spacings.x20 * 4,
                minHeight: theme.spacings.x20,
              ),
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: theme.spacings.x2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: days.map((e) {
                        return GestureDetector(
                          onTap: () {
                            if (state.isRecurring.contains(e.day)) {
                              widget.isRecurring.remove(e.day);
                              widget.onChanged(widget.isRecurring);
                            } else {
                              widget.isRecurring.add(e.day);
                              widget.onChanged(widget.isRecurring);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                              theme.spacings.x2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.palette.textSecondary.withOpacity(
                                0.5,
                              ),
                              borderRadius: BorderRadius.all(
                                theme.radiuses.x4,
                              ),
                              border: Border.all(
                                width: 2,
                                color: state.isRecurring.contains(e.day)
                                    ? theme.palette.buttonPrimary
                                    : Colors.transparent,
                              ),
                            ),
                            child: Text(
                              e.name,
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.palette.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
