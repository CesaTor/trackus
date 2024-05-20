import 'package:trackus/app/repositories/repositories.dart';

class ClearProjects {
  ClearProjects(this.repository);
  final ItemRepository repository;

  Future<void> call() => repository.clearProjects();
}
