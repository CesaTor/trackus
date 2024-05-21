import 'package:trackus/_shared/domain/domain.dart';

class GetProject {
  GetProject(this._repo);
  final ProjectsRepository _repo;

  Future<Project?> call(int id) => _repo.get(id);
}
