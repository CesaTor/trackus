import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trackus/features/task/task.dart';
import 'package:trackus/lib.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskUpdate extends TaskEvent {
  const TaskUpdate(this.item);
  final Item item;

  @override
  List<Object> get props => [Random().nextInt(1000)];
}

class TaskToggle extends TaskEvent {
  const TaskToggle();

  @override
  List<Object> get props => [];
}

class TaskBloc extends Bloc<TaskEvent, Item> {
  TaskBloc({
    required ToggleIsDone toggle,
    required WatchItem watchItem,
    required Item item,
  }) : super(item) {
    watchItem().listen((e) {
      if (e != null) add(TaskUpdate(e));
    });

    on<TaskEvent>(
      (event, emit) async => switch (event) {
        TaskUpdate() => emit(item),
        TaskToggle() => await toggle(),
      },
    );
  }
}
