import 'package:trackus/_shared/domain/domain.dart';

class WatchProject {
  WatchProject(this._repo);
  final ProjectsRepository _repo;

  Stream<Project?> call(int id) => _repo.watch(id);
}

class WatchSingleProject {
  WatchSingleProject(this._repo, this.id);
  final ProjectsRepository _repo;
  final int id;

  Stream<Project?> call() => _repo.watch(id);
}
