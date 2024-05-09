import 'package:isar/isar.dart';

part 'tag.g.dart';

@collection
class Tag {
  /// The id of the Tag
  Id get id => Isar.autoIncrement;

  /// The name of the Tag
  late String name;

  /// The color of the Tag
  late int colorValue;

  /// Check if the Tag is favorite
  late bool isFavorite;
}
