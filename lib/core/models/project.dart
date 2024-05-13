import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'project.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
// ignore: must_be_immutable
class Project extends Equatable {
  Project({
    required this.name,
    required this.colorValue,
    this.id,
    this.isFavorite = false,
    this.layout = Layout.list,
    Project? parent,
  }) {
    this.parent.value = parent;
  }

  Project copyWith({
    Id? id,
    String? name,
    int? colorValue,
    bool? isFavorite,
    Layout? layout,
    Project? parent,
  }) =>
      Project(
        id: id ?? this.id,
        name: name ?? this.name,
        colorValue: colorValue ?? this.colorValue,
        isFavorite: isFavorite ?? this.isFavorite,
        layout: layout ?? this.layout,
        parent: parent ?? this.parent.value,
      );

  /// The id of the project
  late Id? id = Isar.autoIncrement;

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
  IconData get icon => name == 'Inbox' ? Icons.inbox_outlined : Icons.tag;
}
