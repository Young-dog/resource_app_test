import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../app/app.dart';
import '../../../../generated/l10n.dart';

class BottomDateTimePicker extends StatefulWidget {
  const BottomDateTimePicker({
    required this.date,
    required this.onPressedSaveDate,
    this.lastDay,
    super.key,
  });

  final DateTime? date;
  final DateTime? lastDay;
  final void Function(DateTime? date) onPressedSaveDate;

  @override
  State<BottomDateTimePicker> createState() => _BottomDateTimePickerState();
}

class _BottomDateTimePickerState extends State<BottomDateTimePicker> {
  late DateTime _selectedDate;
  Duration? _duration;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date ?? DateTime.now();
    _duration = _addDuration(widget.date);
    _focusedDay = widget.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.date != null)
                IconButton(
                  onPressed: () {
                    widget.onPressedSaveDate(null);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: theme.palette.iconSecondary,
                  ),
                ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: theme.spacings.x4,
                ),
                padding: EdgeInsets.all(theme.spacings.x4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(theme.radiuses.x4),
                ),
                child: TableCalendar(
                  rowHeight: theme.spacings.x9,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    weekendStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    headerPadding: EdgeInsets.zero,
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: theme.textTheme.bodySmall!,
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: theme.palette.buttonPrimary,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: theme.palette.buttonPrimary,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                    setState(() {});
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: DateTime.utc(2023, 01, 01),
                  lastDay: widget.lastDay ?? DateTime.utc(DateTime.now().year+2),
                  focusedDay: _focusedDay,
                  daysOfWeekHeight: theme.spacings.x6,
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    cellMargin: EdgeInsets.zero,
                    rangeEndTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    rangeStartTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    withinRangeTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    outsideTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    disabledTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    holidayTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.buttonShare.withOpacity(0.7),
                    ),
                    selectedTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    defaultTextStyle: theme.textTheme.bodySmall!,
                    weekendTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    weekNumberTextStyle: theme.textTheme.bodySmall!,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.3),
                        ),
                      ),
                      onPressed: () {
                        _showDialog(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: theme.spacings.x4),
                        child: Text(
                          S.of(context).timeButtonTitle,
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.palette.textTertiary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: theme.spacings.x6,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.palette.buttonPrimary,
                        ),
                      ),
                      onPressed: () {
                        final dateNew = DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                        );
                        final date = dateNew.add(_duration ?? Duration.zero);
                        widget.onPressedSaveDate(date);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: theme.spacings.x4),
                        child: Text(
                          S.of(context).saveButtonTitle,
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.palette.textSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext ctx) {
    var time = Duration(
      hours: DateTime.now().hour,
      minutes: DateTime.now().minute,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return Container(
          constraints: BoxConstraints(
            maxHeight: theme.spacings.x20 * 4,
          ),
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: Colors.black.withOpacity(0.9),
          child: SafeArea(
            top: false,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  textStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.palette.textPrimary,
                  ),
                  pickerTextStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.palette.textPrimary,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.spacings.x4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration: _duration ?? time,
                      onTimerDurationChanged: (Duration newDuration) {
                        setState(
                          () => time = newDuration,
                        );
                      },
                    ),
                    Row(
                      children: [
                        if (_duration != null)
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black.withOpacity(0.3),
                                ),
                              ),
                              onPressed: () {
                                final date = DateTime(
                                  widget.date!.year,
                                  widget.date!.month,
                                  widget.date!.day,
                                );

                                widget.onPressedSaveDate(date);

                                setState(() {
                                  _duration = null;
                                });

                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: theme.spacings.x4,
                                ),
                                child: Text(
                                  S.of(context).deleteButtonTitle,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: theme.palette.textTertiary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (_duration != null)
                          SizedBox(
                            width: theme.spacings.x6,
                          ),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                theme.palette.buttonPrimary,
                              ),
                            ),
                            onPressed: () {
                              _duration = time;
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: theme.spacings.x2,
                              ),
                              child: Text(
                                S.of(context).addButtonTitle,
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.palette.textSecondary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Duration? _addDuration(DateTime? date) {
    final gas = Duration(
      hours: date?.hour ?? 0,
      minutes: date?.minute ?? 0,
    );

    return gas.inHours > 0 && gas.inMinutes > 0 ? gas : null;
  }
}
