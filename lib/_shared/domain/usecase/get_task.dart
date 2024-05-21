import 'package:trackus/_shared/domain/domain.dart';

class GetTask {
  GetTask(this._repo);
  final TasksRepository _repo;

  Future<Task?> call(int id) => _repo.get(id);
}
