import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class DeleteProject {
  DeleteProject(this.repository);
  final ItemRepository repository;

  Future<void> call(Project proj) => repository.deleteProject(proj);
}

class DeleteProjectById {
  DeleteProjectById(this.repository);
  final ItemRepository repository;

  Future<void> call(int id) => repository.deleteProjectById(id);
}
