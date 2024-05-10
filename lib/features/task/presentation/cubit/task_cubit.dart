import 'package:bloc/bloc.dart';
import 'package:trackus/features/task/task.dart';
import 'package:trackus/lib.dart';

class TaskCubit extends Cubit<Item> {
  TaskCubit({
    required this.item,
    required this.toggle,
    required this.watchItem,
  }) : super(item);

  final ToggleIsDone toggle;
  final WatchItem watchItem;
  final Item item;

  void init() {
    // Watch the db item update and sync
    watchItem().listen((e) {
      if (e != null) emit(e);
    });
    emit(item);
  }
}
