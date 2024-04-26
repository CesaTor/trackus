import 'package:trackus/core/models/item/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getAllItems();

  Future<void> insertItem(Item item);

  Future<void> updateItem(Item item);

  Future<void> deleteItem(Item item);

  Future<void> deleteItemById(int id);

  Future<void> clearItems();
}
