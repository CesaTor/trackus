import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trackus/_shared/_shared.dart';

final sl = GetIt.instance;

TasksRepository get taskRepo => sl.get<TasksRepositoryImpl>();
ProjectsRepository get projectRepo => sl.get<ProjectsRepositoryImpl>();

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
