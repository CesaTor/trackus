import 'package:trackus/app/repositories/repositories.dart';

class DeleteItemById {
  DeleteItemById(this.repository);
  final ItemRepository repository;

  Future<void> call(int id) => repository.deleteItemById(id);
}
