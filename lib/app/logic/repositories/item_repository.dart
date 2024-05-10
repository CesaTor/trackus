import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/core/extensions/date.dart';

part 'item_repository.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> getIsar(GetIsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ItemSchema, ProjectSchema, TagSchema],
    directory: dir.path,
  );

  // Initialize default project
  if (await isar.projects.filter().nameEqualTo('Inbox').findFirst() == null) {
    await isar.writeTxn(() async {
      await isar.projects.put(
        Project().builder(
          name: 'Inbox',
          colorValue: 0xFF000000,
          isFavorite: true,
          layout: Layout.list,
        ),
      );
    });
  }

  return isar;
}

class ItemRepository {
  ItemRepository(this.ref) : isar = ref.read(getIsarProvider.future);

  final FutureOr<Isar> isar;
  final Ref ref;

  // ----- base methods -----
  Future<List<Item>> getAllItems() => isar.items.where().findAll();

  Future<int> insertItem(Item item) {
    return isar.writeTxn(() => isar.items.put(item));
  }

  Future<int> updateItem(Item item) {
    return isar.writeTxn(() => isar.items.put(item));
  }

  Future<bool> deleteItem(Item item) => deleteItemById(item.id);

  Future<bool> deleteItemById(int id) =>
      isar.writeTxn(() => isar.items.delete(id));

  Future<void> clearItems() => isar.writeTxn(() => isar.items.clear());

  // ----- filter methods -----

  Future<List<Item>> getItemsByDate(
    DateTime date, {
    bool includeDone = false,
  }) {
    final query = isar.items.filter().dueDateBetween(date.start, date.end);

    return includeDone ? query.findAll() : query.isDoneEqualTo(false).findAll();
  }

  Future<List<Item>> getMissedItems() {
    return isar.items
        .filter()
        .dueDateLessThan(DateTime.now())
        .isDoneEqualTo(false)
        .findAll();
  }

  Future<bool> deleteProject(Project project) {
    return deleteProjectById(project.id);
  }

  Future<bool> deleteProjectById(int id) {
    return isar.writeTxn(() => isar.projects.delete(id));
  }

  Future<bool> deleteTag(Tag tag) {
    return deleteTagById(tag.id);
  }

  Future<bool> deleteTagById(int id) {
    return isar.writeTxn(() => isar.tags.delete(id));
  }

  Future<List<Project>> getAllProjects() {
    return isar.projects.where().findAll();
  }

  Future<List<Tag>> getAllTags() {
    return isar.tags.where().findAll();
  }

  Future<int> insertProject(Project project) {
    return isar.writeTxn(() => isar.projects.put(project));
  }

  Future<int> insertTag(Tag tag) {
    return isar.writeTxn(() => isar.tags.put(tag));
  }

  Future<int> updateProject(Project project) {
    return insertProject(project);
  }

  Future<int> updateTag(Tag tag) {
    return insertTag(tag);
  }
}
