import 'package:trackus/app/models/models.dart';
import 'package:trackus/features/task/task.dart';

class WatchItem {
  WatchItem(this._repository);

  final TaskRepository _repository;

  Stream<Item?>? call(int? id) {
    if (id == null) return null;
    return _repository.watch(id);
  }
}
