import 'package:trackus/_shared/domain/domain.dart';

class AddProject {
  AddProject(this._repo);
  final ProjectsRepository _repo;

  Future<Project> call({
    required Project project,
    bool completed = false,
  }) async {
    final id = await _repo.add(project);
    final result = await _repo.get(id);
    if (result == null) {
      throw Exception('Project not found');
    }
    return result;
  }
}
