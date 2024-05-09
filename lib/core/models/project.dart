import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'project.g.dart';

@Collection(ignore: {'props'})
class Project extends Equatable {
  Project({
    required this.name,
    required this.colorValue,
    required this.isFavorite,
    required this.layout,
    Project? parent,
  }) {
    this.parent.value = parent;
  }

  /// The id of the project
  Id get id => Isar.autoIncrement;

  /// The name of the project
  final String name;

  /// The color of the project
  final int colorValue;

  /// The parent project of the project
  final parent = IsarLink<Project>();

  /// Check if the project is favorite
  final bool isFavorite;

  @enumerated
  final Layout layout;

  @override
  List<Object?> get props => [id, name, colorValue, parent, isFavorite, layout];
}

extension ProjectExtension on Project {
  IconData get icon => name == 'Inbox' ? Icons.inbox_outlined : Icons.folder;
}
