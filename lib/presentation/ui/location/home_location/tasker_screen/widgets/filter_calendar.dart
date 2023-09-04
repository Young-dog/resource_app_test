import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../app/app.dart';

class FilterCalendar extends StatefulWidget {
  const FilterCalendar({super.key});

  @override
  State<FilterCalendar> createState() => _FilterCalendarState();
}

class _FilterCalendarState extends State<FilterCalendar> {
  var _selectedDay = DateTime.now();
  var _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // update `_focusedDay` here as well
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      headerStyle: HeaderStyle(
        titleTextStyle: theme.textTheme.bodySmall!,
        formatButtonVisible: false,
        headerPadding: EdgeInsets.zero,
        titleCentered: true,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: theme.palette.buttonPrimary,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: theme.palette.buttonPrimary,
        ),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: theme.textTheme.bodySmall!,
        weekendTextStyle: theme.textTheme.bodySmall!.copyWith(
          color: theme.palette.iconSecondary,
        ),
        weekNumberTextStyle: theme.textTheme.bodySmall!,
      ),
      daysOfWeekHeight: theme.spacings.x6,
      calendarFormat: CalendarFormat.week,
      firstDay: DateTime.utc(2023, 01, 01),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
    );
  }
}
