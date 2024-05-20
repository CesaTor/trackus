import 'package:isar/isar.dart';
import 'package:trackus/app/models/models.dart';

class TaskRepository {
  TaskRepository(this.isar);

  final Isar isar;

  Future<Item> toggleIsDone(Item item) async {
    return isar.writeTxn(
      () async {
        final newItem = item.copyWith(isDone: !item.isDone);
        newItem.id = await isar.items.put(newItem);
        return newItem;
      },
    );
  }

  Future<bool> delete(Item item) async {
    if (item.id == null) return false;
    return isar.writeTxn(() => isar.items.delete(item.id!));
  }

  Stream<Item?> watch(int id) => isar.items.watchObject(id);
}
