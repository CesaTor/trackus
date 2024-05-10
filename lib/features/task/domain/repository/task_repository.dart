import 'package:isar/isar.dart';
import 'package:trackus/core/core.dart';

class TaskRepository {
  TaskRepository(this.isar);

  final Isar isar;

  Future<int> toggleIsDone(Item item) async {
    return isar.writeTxn(
      () async {
        item.isDone = !item.isDone;
        await isar.items.put(item);
        return item.id;
      },
    );
  }

  Future<bool> delete(Item item) {
    return isar.writeTxn(() => isar.items.delete(item.id));
  }

  Stream<Item?> watch(int id) {
    return isar.items.watchObject(id);
  }
}
