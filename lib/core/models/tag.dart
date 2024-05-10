import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'tag.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
// ignore: must_be_immutable
class Tag extends Equatable {
  /// The id of the Tag
  late Id id = Isar.autoIncrement;

  /// The name of the Tag
  late String name;

  /// The color of the Tag
  late int colorValue;

  /// Check if the Tag is favorite
  late bool isFavorite;

  @override
  List<Object?> get props => [id, name, colorValue, isFavorite];
}

extension TagExtension on Tag {
  Tag builder({
    required String name,
    required int colorValue,
    required bool isFavorite,
  }) =>
      this
        ..name = name
        ..colorValue = colorValue
        ..isFavorite = isFavorite;

  Tag copyWith({
    Id? id,
    String? name,
    int? colorValue,
    bool? isFavorite,
  }) =>
      this
        ..id = id ?? this.id
        ..name = name ?? this.name
        ..colorValue = colorValue ?? this.colorValue
        ..isFavorite = isFavorite ?? this.isFavorite;
}
