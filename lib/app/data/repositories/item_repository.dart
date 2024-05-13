import 'package:isar/isar.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/core/extensions/date.dart';

class ItemRepositoryImpl implements ItemRepository {
  ItemRepositoryImpl(this.isar);

  final Isar isar;

  // ----- base methods -----
  @override
  Future<List<Item>> getAllItems() => isar.items.where().findAll();

  @override
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

  @override
  Future<Item?> getItem(int id) {
    return isar.items.filter().idEqualTo(id).findFirst();
  }

  @override
  Future<int> updateItem(Item item) {
    return isar.writeTxn(() => isar.items.put(item));
  }

  @override
  Future<bool> deleteItem(Item item) async {
    if (item.id == null) return false;
    return deleteItemById(item.id!);
  }

  @override
  Future<bool> deleteItemById(int id) =>
      isar.writeTxn(() => isar.items.delete(id));

  @override
  Future<void> clearItems() => isar.writeTxn(() => isar.items.clear());

  @override
  Future<void> clearProjects() => isar.writeTxn(() => isar.projects.clear());

  // ----- filter methods -----

  @override
  Future<List<Item>> getItemsByDate(
    DateTime date, {
    bool includeDone = true,
  }) {
    final query = isar.items.filter().dueDateBetween(date.start, date.end);

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  @override
  Future<List<Item>> getInboxItems({bool includeDone = true}) {
    final query =
        isar.items.filter().projectIsNull().or().project((q) => q.idEqualTo(0));

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  @override
  Future<List<Item>> getItemsByProjectId(
    int projectId, {
    bool includeDone = true,
  }) {
    final query = isar.items.filter().project((q) => q.idEqualTo(0));

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  @override
  Future<List<Item>> getItemsByQuery(String query) {
    return isar.items
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .findAll();
  }

  @override
  Future<List<Project>> getProjectsByQuery(String query) {
    return isar.projects
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();
  }

  @override
  Future<List<Item>> getMissedItems() {
    return isar.items
        .filter()
        .dueDateLessThan(DateTime.now())
        .isDoneEqualTo(false)
        .findAll();
  }

  @override
  Future<bool> deleteProject(Project project) async {
    if (project.id == null) return false;
    return deleteProjectById(project.id!);
  }

  @override
  Future<bool> deleteProjectById(int id) {
    return isar.writeTxn(() => isar.projects.delete(id));
  }

  @override
  Future<List<Project>> getAllProjects() {
    return isar.projects.where().findAll();
  }

  @override
  Future<Project?> getProjectById(int projectId) {
    return isar.projects.where().idEqualTo(projectId).findFirst();
  }

  @override
  Future<int> insertProject(Project project) {
    return isar.writeTxn(() => isar.projects.put(project));
  }

  @override
  Future<int> updateProject(Project project) {
    return insertProject(project);
  }
}
