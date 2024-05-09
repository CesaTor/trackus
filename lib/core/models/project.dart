import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

@collection
class Project {
  /// The id of the project
  Id get id => Isar.autoIncrement;

  /// The name of the project
  late String name;

  /// The color of the project
  late int colorValue;

  /// The parent project of the project
  final parent = IsarLink<Project>();

  /// Check if the project is favorite
  late bool isFavorite;

  @enumerated
  late Layout layout;
}
