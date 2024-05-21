import 'package:trackus/_shared/domain/domain.dart';

abstract class ProjectsRepository {
  Future<List<Project>> getAll();
  Stream<List<Project>> watchAll();
  Future<Project?> get(int id);
  Stream<Project?> watch(int id);
  Future<int> add(Project task);
  Future<void> remove(Project task);
  Future<void> update(Project task);
  Future<List<Project>> search(String query);
}
