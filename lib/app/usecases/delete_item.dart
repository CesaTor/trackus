import 'package:trackus/app/app.dart';

class DeleteItem {
  DeleteItem(this.repository);
  final ItemRepository repository;

  Future<void> call(Item item) => repository.deleteItem(item);
}
