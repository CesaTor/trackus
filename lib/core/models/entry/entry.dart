import 'package:isar/isar.dart';
import 'package:trackus/core/models/item/item.dart';

part 'entry.g.dart';

@collection
class Entry {
  late DateTime start;
  late DateTime? end;

  final item = IsarLink<Item>();

  void set({DateTime? start, DateTime? end}) {
    this.start = start ?? this.start;
    this.end = end ?? this.end;
  }

  Id get id => Isar.autoIncrement;
}
