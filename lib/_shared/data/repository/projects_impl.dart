import 'package:isar/isar.dart';
import 'package:trackus/_shared/data/source/database/database.dart';
import 'package:trackus/_shared/domain/domain.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl(this.database);

  final Database database;

  @override
  Future<int> add(Project project) async {
    final db = database.db;
    return db.writeTxn(() => db.projects.put(project));
  }

  @override
  Future<List<Project>> getAll() {
    return database.projects.where().findAll();
  }

  @override
  Future<void> remove(Project project) async {
    if (project.id == null) return;
    final db = database.db;

    return db.writeTxn(() => db.projects.delete(project.id!));
  }

  @override
  Future<void> update(Project project) {
    return add(project);
  }

  @override
  Future<Project?> get(int id) {
    return database.projects.filter().idEqualTo(id).findFirst();
  }

  @override
  Stream<List<Project>> watchAll() {
    return database.projects.where().watch(fireImmediately: true);
  }

  @override
  Stream<Project?> watch(int id) {
    return database.projects
        .filter()
        .idEqualTo(id)
        .watch(fireImmediately: true)
        .map((event) => event.firstOrNull);
  }

  @override
  Future<List<Project>> search(String query) {
    return database.projects.filter().nameContains(query).findAll();
  }
}
