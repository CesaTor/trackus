import 'package:equatable/equatable.dart';
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
