import 'package:trackus/_shared/domain/domain.dart';

class GetTasksByProjectId extends GetTasks {
  GetTasksByProjectId(this._repo, {required this.id}) : super(_repo);

  final TasksRepository _repo;
  final int id;

  @override
  Stream<List<Task>> call() {
    return _repo.watchAllWhereProjectId(id);
  }
}
