import 'package:isar/isar.dart';
import 'package:trackus/_shared/domain/domain.dart';

class Database {
  Database(this.dbPath);

  final String dbPath;
  late final Isar db;

  Future<void> init() async {
    await _migrate();

    db = await Isar.open(
      [TaskSchema, ProjectSchema],
      directory: dbPath,
    );
  }

  IsarCollection<Task> get tasks => db.tasks;

  IsarCollection<Project> get projects => db.projects;

  Future<void> _migrate() async {
    // TODO(ct): Implement migration
  }
}
