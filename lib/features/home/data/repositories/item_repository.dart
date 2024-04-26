import 'package:isar/isar.dart';
import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/features/home/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  ItemRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<List<Item>> getAllItems() async {
    return isar.items.where().findAll();
  }

  @override
  Future<void> insertItem(Item item) async {
    await isar.items.put(item);
  }

  @override
  Future<void> updateItem(Item item) async {
    await isar.items.put(item);
  }

  @override
  Future<void> deleteItem(Item item) async {
    await isar.items.delete(item.id);
  }

  @override
  Future<void> deleteItemById(int id) async {
    await isar.items.delete(id);
  }

  @override
  Future<void> clearItems() async {
    await isar.items.clear();
  }
}
