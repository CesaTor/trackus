import 'package:flutter/material.dart';
import 'package:trackus/lib.dart';

enum Priority {
  low,
  medium,
  high,
  none;

  Color get color {
    switch (this) {
      case Priority.low:
        return Colors.blue;
      case Priority.medium:
        return Colors.orange;
      case Priority.high:
        return Colors.red;
      case Priority.none:
        return Colors.grey;
    }
  }

  String get name {
    switch (this) {
      case Priority.low:
        return i18n.core.priority.low;
      case Priority.medium:
        return i18n.core.priority.medium;
      case Priority.high:
        return i18n.core.priority.high;
      case Priority.none:
        return i18n.core.priority.none;
    }
  }
}
