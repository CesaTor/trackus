import 'package:trackus/app/app.dart';

class GetProjectById {
  GetProjectById(this.repository, this.projectId);
  final ItemRepository repository;
  final int projectId;

  Future<Project?> call() async {
    final res = await repository.getProjectById(projectId);
    return res;
  }
}
