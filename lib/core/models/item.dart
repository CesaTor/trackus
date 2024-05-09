import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'item.g.dart';

@collection
class Item {
  /// The id of the item.
  Id get id => Isar.autoIncrement;

  /// The name of the item.
  late String title;

  /// The description of the item.
  String? description;

  /// The priority of the item.
  @enumerated
  late Priority priority;

  /// The project of the item, null if Inbox
  final project = IsarLink<Project>();

  /// The tags of the item, null if no tags
  final tags = IsarLinks<Tag>();
}
