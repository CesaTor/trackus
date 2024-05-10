import 'package:trackus/app/domain/domain.dart';

class ClearProjects {
  ClearProjects(this.repository);
  final ItemRepository repository;

  Future<void> call() => repository.clearProjects();
}
