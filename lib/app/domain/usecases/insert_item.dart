import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class InsertItem {
  InsertItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.insertItem(item);
}
