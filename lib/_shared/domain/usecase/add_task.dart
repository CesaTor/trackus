import 'package:trackus/_shared/domain/domain.dart';

class AddTask {
  AddTask(this._repo);
  final TasksRepository _repo;

  Future<Task> call({
    required Task task,
    bool completed = false,
  }) async {
    final id = await _repo.add(task);
    final result = await _repo.get(id);
    if (result == null) {
      throw Exception('Task not found');
    }
    return result;
  }
}
