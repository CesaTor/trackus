import 'package:trackus/core/core.dart';
import 'package:trackus/features/home/domain/domain.dart';

class DeleteItem {
  DeleteItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.deleteItem(item);
}