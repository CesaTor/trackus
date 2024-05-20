import 'package:trackus/app/models/models.dart';
import 'package:trackus/features/task/task.dart';

class ToggleIsDone {
  ToggleIsDone(
    this.repository,
  );
  final TaskRepository repository;

  Future<Item> call(Item item) => repository.toggleIsDone(item);
}
