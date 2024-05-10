import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'item.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
// ignore: must_be_immutable
class Item extends Equatable {
  /// The id of the item.
  late Id id = Isar.autoIncrement;

  /// The name of the item.
  late String title;

  /// The status of the item.
  late bool isDone;

  /// The description of the item.
  late String? description;

  /// The due date of the item.
  late DateTime? dueDate;

  /// The reminder of the item.
  late DateTime? reminderDateTime;

  /// The priority of the item.
  @enumerated
  late Priority priority;

  /// The project of the item, null if Inbox
  final project = IsarLink<Project>();

  /// The tags of the item, null if no tags
  final tags = IsarLinks<Tag>();

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
        description,
        dueDate,
        priority,
        project,
        tags,
      ];
}

extension ItemExtension on Item {
  TimeOfDay? get reminder => reminderDateTime == null
      ? null
      : TimeOfDay.fromDateTime(reminderDateTime!);

  Item builder({
    required String title,
    required bool isDone,
    required String? description,
    required Project? project,
    required List<Tag>? tags,
    DateTime? reminderDateTime,
    DateTime? dueDate,
    Priority priority = Priority.none,
  }) {
    this
      ..title = title
      ..isDone = isDone
      ..description = description
      ..dueDate = dueDate
      ..reminderDateTime = reminderDateTime
      ..priority = priority
      ..project.value = project
      ..tags.addAll(tags ?? []);

    return this;
  }

  Item copyWith({
    Id? id,
    String? title,
    bool? isDone,
    String? description,
    DateTime? dueDate,
    DateTime? reminderDateTime,
    Priority? priority,
    Project? project,
    List<Tag>? tags,
  }) {
    this
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..isDone = isDone ?? this.isDone
      ..description = description ?? this.description
      ..dueDate = dueDate ?? this.dueDate
      ..reminderDateTime = reminderDateTime ?? this.reminderDateTime
      ..priority = priority ?? this.priority
      ..project.value = project ?? this.project.value
      ..tags.addAll(tags ?? []);

    return this;
  }
}
