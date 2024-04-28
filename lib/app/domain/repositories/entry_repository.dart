import 'package:trackus/core/core.dart';

abstract class EntryRepository {
  Future<int> insertEntry(Entry entry);

  Future<List<Entry>> getEntriesByItemId(int id);
}
