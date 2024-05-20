import 'package:trackus/app/app.dart';

class GetAllProjects {
  GetAllProjects(this.repository);
  final ItemRepository repository;

  Future<List<Project>> call() async {
    final res = await repository.getAllProjects();
    return res;
  }
}
