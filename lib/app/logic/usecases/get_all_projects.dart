import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class GetAllProjects {
  GetAllProjects(this.repository);
  final ItemRepository repository;

  Future<List<Project>> call() async {
    final res = await repository.getAllProjects();
    return res;
  }
}
