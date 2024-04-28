import 'package:trackus/core/core.dart';

abstract class ItemRepository {
  Future<List<Item>> getAllItems();

  Future<int> insertItem(Item item);

  Future<int> updateItem(Item item);

  Future<bool> deleteItem(Item item);

  Future<bool> deleteItemById(int id);

  Future<void> clearItems();
}
