import 'package:flutter/material.dart';
import 'package:trackus/core/extensions/extensions.dart';
import 'package:trackus/lib.dart';

final defaultColor = projectColors.first;

final projectColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
  Colors.brown,
  Colors.grey,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.amber,
  Colors.brown,
  Colors.grey,
  Colors.teal,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.redAccent,
  Colors.orangeAccent,
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.blueAccent,
  Colors.indigoAccent,
  Colors.purpleAccent,
  Colors.pinkAccent,
  Colors.limeAccent,
  Colors.amberAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
  Colors.white,
];

DateTime get today => DateTime.now().end;

DateTime get tomorrow => DateTime.now().add(const Duration(days: 1)).end;

Project defaultProject = Project(
  id: 0,
  name: i18n.core.project.inbox,
  colorValue: Colors.grey.value,
  isFavorite: true,
);
