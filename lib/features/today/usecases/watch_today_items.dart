import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/repositories.dart';

class WatchTodayItems {
  WatchTodayItems(this.repository);
  final ItemRepository repository;

  Stream<List<Item>> call() => repository.watchItemsByDate(DateTime.now());
}
