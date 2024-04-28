import 'package:isar/isar.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class ItemRepositoryImpl implements ItemRepository {
  ItemRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<List<Item>> getAllItems() => isar.items.where().findAll();

  @override
  Future<int> insertItem(Item item) =>
      isar.writeTxn(() => isar.items.put(item));

  @override
  Future<int> updateItem(Item item) => insertItem(item);

  @override
  Future<bool> deleteItem(Item item) => deleteItemById(item.id);

  @override
  Future<bool> deleteItemById(int id) =>
      isar.writeTxn(() => isar.items.delete(id));

  @override
  Future<void> clearItems() => isar.writeTxn(() => isar.items.clear());
}
