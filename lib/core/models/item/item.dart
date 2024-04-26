import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Item with _$Item {
  const factory Item({
    required String name,
    required String description,
    required int colorValue, // const Color(0xFF42A5F5);
  }) = _Item;
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  const Item._();

  /// add this
  Id get id => Isar.autoIncrement;

  @override
  String toString() => '$id';
}
