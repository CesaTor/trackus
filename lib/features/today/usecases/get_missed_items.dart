import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/item_repository.dart';

class GetMissedItems {
  GetMissedItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getMissedItems();
}
