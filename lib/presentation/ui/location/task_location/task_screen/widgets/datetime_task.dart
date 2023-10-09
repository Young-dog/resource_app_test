import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class DateTimeTask extends StatelessWidget {
  const DateTimeTask({
    required this.onChangedDateFirst,
    required this.onChangedDateSecond,
    this.dateFirst,
    this.dateSecond,
    super.key,
  });

  final DateTime? dateFirst;
  final void Function(DateTime? value) onChangedDateFirst;

  final DateTime? dateSecond;
  final void Function(DateTime? value) onChangedDateSecond;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final monthFormat = DateFormat.MMMM('ru_RU');

    return Row(
      children: [
        if (dateFirst != null)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _selectDate(ctx: context, date: dateFirst, onPressedSaveDate: onChangedDateFirst);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.spacings.x1,
                    horizontal: theme.spacings.x2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.palette.buttonTertiary,
                    borderRadius: BorderRadius.all(theme.radiuses.x4),
                  ),
                  child: Text(
                    '${dateFirst!.day} ${monthFormat.format(dateFirst!).substring(0, 4)}... '
                    '${dateFirst?.minute == 0 && dateFirst?.hour == 0 ? '' : '${dateFirst?.hour}:${dateFirst?.minute}'} ',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
               Icon(Icons.navigate_next_rounded, color: theme.palette.iconPrimary,),
              GestureDetector(
                onTap: () {
                  _selectDate(ctx: context, date: dateSecond, onPressedSaveDate: onChangedDateSecond);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.spacings.x1,
                    horizontal: theme.spacings.x2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.palette.buttonTertiary,
                    borderRadius: BorderRadius.all(theme.radiuses.x4),
                  ),
                  child: dateSecond != null ? Text(
                    '${dateSecond!.day} ${monthFormat.format(dateSecond!).substring(0, 4)}... '
                        '${dateSecond?.minute == 0 && dateSecond?.hour == 0 ? '' : '${dateSecond?.hour}:${dateSecond?.minute}'} ',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ) : Icon(Icons.calendar_month, color: theme.palette.iconPrimary,),
                ),
              ),
            ],
          ),

      ],
    );
  }

  Future<void> _selectDate({
    required BuildContext ctx,
    required DateTime? date,
    required void Function(DateTime? value) onPressedSaveDate,
  }) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<TaskBloc>(ctx),
          child: BottomDateTimePicker(
            date: date,
            onPressedSaveDate: onPressedSaveDate,
          ),
        );
      },
    );
  }
}
