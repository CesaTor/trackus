import 'package:trackus/_shared/domain/domain.dart';

class GetProjects {
  GetProjects(this._repo);

  final ProjectsRepository _repo;

  Stream<List<Project>> call() {
    return _repo.watchAll();
  }
}
