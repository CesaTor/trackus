import 'package:flutter/material.dart';

enum Layout {
  list,
  kanban,
  calendar;

  String get name {
    switch (this) {
      case Layout.list:
        return 'List';
      case Layout.kanban:
        return 'Kanban';
      case Layout.calendar:
        return 'Calendar';
    }
  }

  IconData get icon {
    switch (this) {
      case Layout.list:
        return Icons.list;
      case Layout.kanban:
        return Icons.view_agenda;
      case Layout.calendar:
        return Icons.calendar_today;
    }
  }
}
