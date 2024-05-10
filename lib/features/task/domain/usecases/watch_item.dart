import 'package:trackus/features/task/task.dart';
import 'package:trackus/lib.dart';

class WatchItem {
  WatchItem(
    this._repository,
    this.item,
  );

  final TaskRepository _repository;
  final Item item;

  Stream<Item?> call() => _repository.watch(item.id);
}