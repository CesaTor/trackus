import 'package:trackus/app/domain/repositories/entry_repository.dart';
import 'package:trackus/core/core.dart';

class InsertEntry {
  InsertEntry(this.repository);
  final EntryRepository repository;

  Future<void> call(Entry entry) => repository.insertEntry(entry);
}
