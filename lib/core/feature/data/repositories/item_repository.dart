import 'package:isar/isar.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/core/feature/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  ItemRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<List<Item>> getAllItems() => isar.items.where().findAll();

  @override
  Future<void> insertItem(Item item) {
    return isar.writeTxn(() async => isar.items.put(item));
  }

  @override
  Future<void> updateItem(Item item) => insertItem(item);

  @override
  Future<void> deleteItem(Item item) => deleteItemById(item.id);

  @override
  Future<void> deleteItemById(int id) {
    return isar.writeTxn(() async => isar.items.delete(id));
  }

  @override
  Future<void> clearItems() => isar.writeTxn(() async => isar.items.clear());
}
