import 'package:trackus/_shared/domain/domain.dart';

abstract class TasksRepository {
  Future<List<Task>> getAll();
  Stream<List<Task>> watchAll();
  Future<Task?> get(int id);
  Future<int> add(Task task);
  Future<void> remove(Task task);
  Future<void> update(Task task);
}
