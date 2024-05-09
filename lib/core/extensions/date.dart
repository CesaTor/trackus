extension DateTimeExtension on DateTime {
  DateTime get start => DateTime(year, month, day);
  DateTime get end => DateTime(year, month, day, 23, 59, 59);
}
