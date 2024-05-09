import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'project.g.dart';

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

extension ProjectExtension on Project {
  IconData get icon => name == 'Inbox' ? Icons.inbox_outlined : Icons.folder;
}
