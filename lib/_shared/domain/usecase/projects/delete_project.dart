import 'package:trackus/_shared/domain/domain.dart';

class DeleteProject {
  DeleteProject(this._repo);
  final ProjectsRepository _repo;

  Future<void> call(int id) async {
    final current = await _repo.get(id);
    if (current == null) {
      throw Exception('Project not found');
    }
    await _repo.remove(current);
  }
}
