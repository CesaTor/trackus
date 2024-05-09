import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackus/lib.dart';

extension DateTimeExtension on DateTime {
  DateTime get start => DateTime(year, month, day);
  DateTime get end => DateTime(year, month, day, 23, 59, 59);

  bool isSame(DateTime other) => difference(other) == Duration.zero;

  String get humanString {
    if (isSame(today)) {
      return 'Today';
    } else if (isSame(tomorrow)) {
      return 'Tomorrow';
    }
    return DateFormat('dd MMM').format(this);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay get end => const TimeOfDay(hour: 23, minute: 59);
}
