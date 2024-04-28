import 'package:trackus/core/core.dart';

class GetAllItems {
  GetAllItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getAllItems();
}
