import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app.dart';
import '../../../presentation.dart';

class DateTermTask extends StatelessWidget {
  const DateTermTask({
    required this.date,
    required this.onPressedSaveDate,
    super.key,
  });

  final DateTime? date;
  final void Function(DateTime? date) onPressedSaveDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        _selectDate(context, date);
      },
      icon: Icon(
        Icons.calendar_month,
        color: date != null ? theme.palette.buttonPrimary : null,
      ),
    );
  }

  Future<void> _selectDate(BuildContext ctx, DateTime? date) async {
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
