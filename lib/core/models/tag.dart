import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'tag.g.dart';

@Collection(ignore: {'props'}, inheritance: false)
class Tag extends Equatable {
  const Tag({
    required this.name,
    required this.colorValue,
    required this.isFavorite,
  });

  /// The id of the Tag
  Id get id => Isar.autoIncrement;

  /// The name of the Tag
  final String name;

  /// The color of the Tag
  final int colorValue;

  /// Check if the Tag is favorite
  final bool isFavorite;

  @override
  List<Object?> get props => [id, name, colorValue, isFavorite];
}
