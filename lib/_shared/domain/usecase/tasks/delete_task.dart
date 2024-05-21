import 'package:trackus/_shared/domain/domain.dart';

class DeleteTask {
  DeleteTask(this._repo);
  final TasksRepository _repo;

  Future<void> call(int id) async {
    final current = await _repo.get(id);
    if (current == null) {
      throw Exception('Task not found');
    }
    await _repo.remove(current);
  }
}
