import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/features/home/domain/domain.dart';

class InsertItem {
  InsertItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.insertItem(item);
}
