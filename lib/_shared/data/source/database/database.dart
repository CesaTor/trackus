import 'package:isar/isar.dart';
import 'package:trackus/_shared/domain/domain.dart';

class Database {
  Database(
    this.dbPath, {
    this.postInit,
  });

  final String dbPath;
  late final Isar db;

  List<void Function(Isar isar)>? postInit;

  Future<Database> init() async {
    db = await Isar.open(
      [TaskSchema, ProjectSchema],
      directory: dbPath,
    );

    await _migrate();

    postInit?.forEach((f) => f(db));
    return this;
  }

  IsarCollection<Task> get tasks => db.tasks;

  IsarCollection<Project> get projects => db.projects;

  Future<void> _migrate() async {
    // TODO(ct): Implement migration
  }
}
