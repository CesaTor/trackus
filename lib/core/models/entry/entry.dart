import 'package:isar/isar.dart';
import 'package:trackus/core/models/item/item.dart';

part 'entry.g.dart';

@collection
class Entry {
  late DateTime start;
  late DateTime? end;

  final item = IsarLink<Item>();

  Id get id => Isar.autoIncrement;
}
