import 'package:trackus/features/home/domain/domain.dart';

class DeleteItemById {
  DeleteItemById(this.repository);
  final ItemRepository repository;

  Future<void> call(int id) => repository.deleteItemById(id);
}
