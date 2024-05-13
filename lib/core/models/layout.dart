import 'package:flutter/material.dart';
import 'package:trackus/lib.dart';

enum Layout {
  list,
  kanban,
  calendar;

  String get name {
    switch (this) {
      case Layout.list:
        return i18n.core.layout.list;
      case Layout.kanban:
        return i18n.core.layout.kanban;
      case Layout.calendar:
        return i18n.core.layout.calendar;
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
