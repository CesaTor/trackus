import 'package:isar/isar.dart';
import 'package:trackus/app/extensions/extensions.dart';
import 'package:trackus/app/models/models.dart';

class ItemRepository {
  ItemRepository(this.isar);

  final Isar isar;

  // ----- base methods -----
  Future<List<Item>> getAllItems() => isar.items.where().findAll();

  Future<int> insertItem(Item item) async {
    int? id;
    await isar.writeTxn(
      () async {
        id = await isar.items.put(item);
        if (item.project.value != null) {
          await isar.projects.put(item.project.value!);
        }
        await item.project.save();
      },
    );

    return id ?? -1;
  }

  Future<Item?> getItem(int id) {
    return isar.items.filter().idEqualTo(id).findFirst();
  }

  Future<int> updateItem(Item item) {
    return isar.writeTxn(() => isar.items.put(item));
  }

  Future<bool> deleteItem(Item item) async {
    if (item.id == null) return false;
    return deleteItemById(item.id!);
  }

  Future<bool> deleteItemById(int id) =>
      isar.writeTxn(() => isar.items.delete(id));

  Future<void> clearItems() => isar.writeTxn(() => isar.items.clear());

  Future<void> clearProjects() => isar.writeTxn(() => isar.projects.clear());

  // ----- filter methods -----

  Future<List<Item>> getItemsByDate(
    DateTime date, {
    bool includeDone = true,
  }) {
    final query = isar.items.filter().dueDateBetween(date.start, date.end);

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  Future<List<Item>> getInboxItems({bool includeDone = true}) {
    final query =
        isar.items.filter().projectIsNull().or().project((q) => q.idEqualTo(0));

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  Future<List<Item>> getItemsByProjectId(
    int projectId, {
    bool includeDone = true,
  }) {
    final query = isar.items.filter().project((q) => q.idEqualTo(projectId));

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  Future<List<Item>> getItemsByQuery(String query) {
    return isar.items
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .findAll();
  }

  Future<List<Project>> getProjectsByQuery(String query) {
    return isar.projects
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();
  }

  Future<List<Item>> getMissedItems() {
    return isar.items
        .filter()
        .dueDateLessThan(DateTime.now())
        .isDoneEqualTo(false)
        .findAll();
  }

  Future<bool> deleteProject(Project project) async {
    if (project.id == null) return false;
    return deleteProjectById(project.id!);
  }

  Future<bool> deleteProjectById(int id) {
    return isar.writeTxn(() => isar.projects.delete(id));
  }

  Future<List<Project>> getAllProjects() {
    return isar.projects.where().findAll();
  }

  Future<Project?> getProjectById(int projectId) {
    return isar.projects.where().idEqualTo(projectId).findFirst();
  }

  Future<int> insertProject(Project project) {
    return isar.writeTxn(() => isar.projects.put(project));
  }

  Future<int> updateProject(Project project) {
    return insertProject(project);
  }

  /// Stream methods

  Stream<List<Item>> watchAllItems() => isar.items.where().watch();

  Stream<List<Project>> watchAllProjects() => isar.projects.where().watch();

  @override
  Stream<List<Item>> watchItemsByProject(int projectId) =>
      isar.items.filter().project((q) => q.idEqualTo(projectId)).watch();

  @override
  Stream<List<Item>> watchItemsByDate(DateTime date) =>
      isar.items.filter().dueDateBetween(date.start, date.end).watch();
}
