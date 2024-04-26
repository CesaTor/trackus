import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Entry with _$Entry {
  const factory Entry({
    required DateTime start,
    required DateTime? end,
  }) = _Entry;
  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  const Entry._();

  /// add this
  Id get id => Isar.autoIncrement;

  @override
  String toString() => '$id';
}
