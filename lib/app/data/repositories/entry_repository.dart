import 'package:isar/isar.dart';
import 'package:trackus/app/domain/repositories/entry_repository.dart';
import 'package:trackus/core/core.dart';

class EntryRepositoryImpl implements EntryRepository {
  EntryRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<int> insertEntry(Entry entry) async {
    final res = await isar.writeTxn(() => isar.entrys.put(entry));
    return res;
  }

  // TODO: check why item is null
  @override
  Future<List<Entry>> getEntriesByItemId(int id) =>
      isar.entrys.where().filter().item((q) => q.idEqualTo(id)).findAll();
}
