import 'package:trackus/core/core.dart';

class UpdateItem {
  UpdateItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.updateItem(item);
}
