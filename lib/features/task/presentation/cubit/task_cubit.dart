import 'package:bloc/bloc.dart';
import 'package:trackus/features/task/domain/usecases/watch_item.dart';
import 'package:trackus/lib.dart';

class TaskCubit extends Cubit<Item> {
  TaskCubit({
    required this.item,
    required this.updateItem,
    required WatchItem watchItem,
  }) : super(item) {
    // Watch the db item update and sync
    watchItem(item.id)?.listen(emit);
  }

  final UpdateItem updateItem;

  final Item item;

  Future<void> toggle({bool? isDone = false}) async {
    final newItem = state.copyWith(isDone: isDone);
    await updateItem(newItem);
    emit(newItem);
  }
}
