import 'package:trackus/core/core.dart';

abstract class ItemRepository {
  // ----- base methods -----

  Future<List<Item>> getAllItems();

  Future<List<Project>> getAllProjects();

  Future<int> insertItem(Item item);

  Future<Item?> getItem(int id);

  Future<int> insertProject(Project project);

  Future<int> updateItem(Item item);

  Future<int> updateProject(Project project);

  Future<bool> deleteItem(Item item);

  Future<bool> deleteProject(Project project);

  Future<bool> deleteItemById(int id);

  Future<bool> deleteProjectById(int id);

  Future<void> clearItems();

  Future<void> clearProjects();
  // ----- filter methods -----
  Future<List<Item>> getItemsByDate(DateTime date, {bool includeDone = true});
  Future<List<Item>> getItemsByProjectName(
    String projectName, {
    bool includeDone = true,
  });

  Future<List<Item>> getMissedItems();
}
