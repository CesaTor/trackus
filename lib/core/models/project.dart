import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'project.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
// ignore: must_be_immutable
class Project extends Equatable {
  /// The id of the project
  late Id id;

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

  @override
  List<Object?> get props => [id, name, colorValue, parent, isFavorite, layout];
}

extension ProjectExtension on Project {
  IconData get icon => name == 'Inbox' ? Icons.inbox_outlined : Icons.folder;

  Project builder({
    required String name,
    required int colorValue,
    required bool isFavorite,
    required Layout layout,
    Project? parent,
  }) =>
      this
        ..name = name
        ..colorValue = colorValue
        ..isFavorite = isFavorite
        ..layout = layout
        ..parent.value = parent;

  Project copyWith({
    String? name,
    int? colorValue,
    bool? isFavorite,
    Layout? layout,
    Project? parent,
  }) =>
      this
        ..name = name ?? this.name
        ..colorValue = colorValue ?? this.colorValue
        ..isFavorite = isFavorite ?? this.isFavorite
        ..layout = layout ?? this.layout
        ..parent.value = parent ?? this.parent.value;
}
