import 'package:isar/isar.dart';
import 'package:trackus/_shared/data/source/database/database.dart';
import 'package:trackus/_shared/domain/domain.dart';

class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this.database);

  final Database database;

  @override
  Future<int> add(Task task, {Project? project}) async {
    final db = database.db;

    return db.writeTxn(
      () async {
        final id = await db.tasks.put(task);
        if (project != null) {
          await db.projects.put(project);
          task.project.value = project;
          await task.project.save();
        }
        return id;
      },
    );
  }

  @override
  Future<List<Task>> getAll() {
    return database.tasks.where().findAll();
  }

  @override
  Future<void> remove(Task task) async {
    if (task.id == null) return;
    final db = database.db;

    return db.writeTxn(() => db.tasks.delete(task.id!));
  }

  @override
  Future<void> update(Task task, {Project? project}) {
    return add(task, project: project);
  }

  @override
  Future<Task?> get(int id) {
    return database.tasks.filter().idEqualTo(id).findFirst();
  }

  @override
  Stream<List<Task>> watchAll() {
    return database.tasks.where().watch(fireImmediately: true);
  }

  @override
  Stream<List<Task>> watchAllWhereProjectId(int id) {
    return database.tasks
        .filter()
        .project((q) => q.idEqualTo(id))
        .watch(fireImmediately: true);
  }

  @override
  Future<List<Task>> search(String query) {
    return database.tasks
        .filter()
        .titleContains(query)
        .or()
        .descriptionContains(query)
        .findAll();
  }
}
