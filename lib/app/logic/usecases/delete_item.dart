import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class DeleteItem {
  DeleteItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.deleteItem(item);
}
