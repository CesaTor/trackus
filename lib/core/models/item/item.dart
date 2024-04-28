import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trackus/lib.dart';

part 'item.g.dart';

@collection
class Item {
  late String name;
  String? description;
  late int colorValue;

  Item copyWith({String? name, String? description, int? colorValue}) {
    return Item()
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..colorValue = colorValue ?? this.colorValue;
  }

  Id get id => Isar.autoIncrement;
}

extension ColorExtension on int? {
  Color get color => Color(this ?? defaultColor.value);
}
