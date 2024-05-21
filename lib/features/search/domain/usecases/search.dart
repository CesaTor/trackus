import 'package:trackus/_shared/_shared.dart';

class Search {
  Search(this.taskRepo, this.projRepo);

  final TasksRepository taskRepo;
  final ProjectsRepository projRepo;

  Future<({List<Task> items, List<Project> projects})> call(
    String query,
  ) async {
    final items = taskRepo.search(query);
    final projects = projRepo.search(query);
    final res = await Future.wait([items, projects]);

    return (items: res[0] as List<Task>, projects: res[1] as List<Project>);
  }
}
