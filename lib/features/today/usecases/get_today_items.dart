import 'package:trackus/lib.dart';

class GetTodayItems {
  GetTodayItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getItemsByDate(DateTime.now());
}
