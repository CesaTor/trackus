import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/app/models/models.dart';

part 'item.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
// ignore: must_be_immutable
class Item extends Equatable {
  Item({
    required this.title,
    required this.isDone,
    this.id,
    this.description,
    this.dueDate,
    this.reminderDateTime,
    this.priority = Priority.none,
    Project? project,
  }) {
    this.project.value = project;
  }

  Item.empty()
      : title = '',
        isDone = false,
        description = null,
        dueDate = null,
        reminderDateTime = null,
        priority = Priority.none;

  Item copyWith({
    Id? id,
    String? title,
    bool? isDone,
    String? description,
    DateTime? dueDate,
    DateTime? reminderDateTime,
    Priority? priority,
    Project? project,
  }) =>
      Item(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        description: description ?? this.description,
        dueDate: dueDate ?? this.dueDate,
        reminderDateTime: reminderDateTime ?? this.reminderDateTime,
        priority: priority ?? this.priority,
        project: project ?? this.project.value,
      );

  /// The id of the item.
  late Id? id = Isar.autoIncrement;

  /// The name of the item.
  final String title;

  /// The status of the item.
  final bool isDone;

  /// The description of the item.
  final String? description;

  /// The due date of the item.
  final DateTime? dueDate;

  /// The reminder of the item.
  final DateTime? reminderDateTime;

  /// The priority of the item.
  @enumerated
  final Priority priority;

  /// The project of the item, null if Inbox
  final project = IsarLink<Project>();

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
        description,
        dueDate,
        priority,
        project,
      ];
}

extension ItemExtension on Item {
  TimeOfDay? get reminder => reminderDateTime == null
      ? null
      : TimeOfDay.fromDateTime(reminderDateTime!);
}
