// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../generated/l10n.dart';

class BottomTimePicker extends StatefulWidget {
  BottomTimePicker({
    required this.time,
    required this.onTimerDurationChanged,
    super.key,
  });

  Duration? time;
  final void Function(Duration?) onTimerDurationChanged;

  @override
  State<BottomTimePicker> createState() => _BottomTimePickerState();
}

class _BottomTimePickerState extends State<BottomTimePicker> {

  final _duration = Duration(
    hours: DateTime.now().hour,
    minutes: DateTime.now().minute,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      constraints: BoxConstraints(
        minHeight: theme.spacings.x20,
        maxHeight: theme.spacings.x20 * 4,
      ),
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
              children: [
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: widget.time ??
                      _duration,
                  onTimerDurationChanged: (value) {
                    setState(() {
                      widget.time = value;
                    });
                  },
                ),
                Row(
                  children: [
                    if (widget.time != null)
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(0.3),
                            ),
                          ),
                          onPressed: () {
                            widget.onTimerDurationChanged(null);
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
                    if (widget.time != null)
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
                          if (widget.time != null ) {
                            widget.onTimerDurationChanged(widget.time);
                          } else {
                            widget.onTimerDurationChanged(_duration);
                          }
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
  }
}
