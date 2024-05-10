import 'package:trackus/core/core.dart';

abstract class ItemRepository {
  // ----- base methods -----

  Future<List<Item>> getAllItems();

  Future<List<Project>> getAllProjects();

  Future<List<Tag>> getAllTags();

  Future<int> insertItem(Item item);

  Future<int> insertProject(Project project);

  Future<int> insertTag(Tag tag);

  Future<int> updateItem(Item item);

  Future<int> updateProject(Project project);

  Future<int> updateTag(Tag tag);

  Future<bool> deleteItem(Item item);

  Future<bool> deleteProject(Project project);

  Future<bool> deleteTag(Tag tag);

  Future<bool> deleteItemById(int id);

  Future<bool> deleteProjectById(int id);

  Future<bool> deleteTagById(int id);

  Future<void> clearItems();
  // ----- filter methods -----
  Future<List<Item>> getItemsByDate(DateTime date, {bool includeDone = false});

  Future<List<Item>> getMissedItems();

  Stream<List<Item>> watchItems(int id);
}
