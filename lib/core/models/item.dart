import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'item.g.dart';

@Collection(ignore: {'props'})
class Item extends Equatable {
  Item({
    required this.title,
    required this.isDone,
    required this.priority,
    this.description,
    this.dueDate,
    this.reminderDateTime,
    Project? project,
    List<Tag> tags = const [],
  }) {
    this.project.value = project;
    this.tags.addAll(tags);
  }

  /// The id of the item.
  Id get id => Isar.autoIncrement;

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

  Item copyWith({
    String? title,
    bool? isDone,
    String? description,
    DateTime? dueDate,
    DateTime? reminderDateTime,
    Priority? priority,
    Project? project,
    List<Tag>? tags,
  }) {
    return Item(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      reminderDateTime: reminderDateTime ?? this.reminderDateTime,
      priority: priority ?? this.priority,
      project: project ?? this.project.value,
      tags: tags ?? this.tags.toList(),
    );
  }
}
