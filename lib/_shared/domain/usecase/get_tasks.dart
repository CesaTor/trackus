import 'package:trackus/_shared/domain/domain.dart';

class GetTasks {
  GetTasks(this._repo);

  final TasksRepository _repo;

  Stream<List<Task>> call() {
    return _repo.watchAll();
  }
}
