import 'package:trackus/_shared/domain/domain.dart';

class UpdateProject {
  UpdateProject(this._repo);

  final ProjectsRepository _repo;

  Future<void> call(Project todo) async {
    await _repo.update(todo);
  }
}
