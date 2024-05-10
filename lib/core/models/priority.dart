import 'package:flutter/material.dart';

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
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
      case Priority.none:
        return 'None';
    }
  }
}
