import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/features/home/domain/domain.dart';

class UpdateItem {
  UpdateItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.updateItem(item);
}
