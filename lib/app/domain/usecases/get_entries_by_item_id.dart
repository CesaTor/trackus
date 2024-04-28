import 'package:trackus/app/domain/repositories/entry_repository.dart';
import 'package:trackus/core/core.dart';

class GetEntriesByItemId {
  GetEntriesByItemId(this.repository);
  final EntryRepository repository;

  Future<List<Entry>> call(int id) => repository.getEntriesByItemId(id);
}
