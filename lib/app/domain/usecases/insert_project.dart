import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class InsertProject {
  InsertProject(this.repository);
  final ItemRepository repository;

  Future<Project> call(Project proj) async {
    final id = await repository.insertProject(proj);
    return proj.copyWith(id: id);
  }
}
