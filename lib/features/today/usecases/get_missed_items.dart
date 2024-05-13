import 'package:trackus/lib.dart';

class GetMissedItems {
  GetMissedItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getMissedItems();
}
