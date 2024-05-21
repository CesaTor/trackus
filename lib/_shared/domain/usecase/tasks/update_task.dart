import 'package:trackus/_shared/domain/domain.dart';

class UpdateTask {
  UpdateTask(this._repo);

  final TasksRepository _repo;

  Future<void> call(Task todo) async {
    await _repo.update(todo);
  }
}
