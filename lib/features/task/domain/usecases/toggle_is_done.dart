import 'package:trackus/core/core.dart';
import 'package:trackus/features/task/task.dart';

class ToggleIsDone {
  ToggleIsDone(
    this.repository,
    this.item,
  );
  final TaskRepository repository;
  final Item item;

  Future<void> call() => repository.toggleIsDone(item);
}
