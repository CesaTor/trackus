import 'package:isar/isar.dart';

part 'item.g.dart';

@collection
class Item {
  late String name;
  String? description;
  late int colorValue;

  Id get id => Isar.autoIncrement;
}
