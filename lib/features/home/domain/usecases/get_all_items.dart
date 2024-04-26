import 'package:trackus/core/core.dart';
import 'package:trackus/features/home/domain/domain.dart';

class GetAllItems {
  GetAllItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getAllItems();
}
