import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/item_repository.dart';

class GetTodayItems {
  GetTodayItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getItemsByDate(DateTime.now());
}
