import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay, int> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(int json) => TimeOfDay(
      hour: json ~/ 60, minute: json % 60);

  @override
  int toJson(TimeOfDay? object) => object?.hour ?? 0 * 60 + (object?.minute ?? 0);
}
