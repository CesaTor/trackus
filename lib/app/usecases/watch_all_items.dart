import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/repositories.dart';

class WatchAllItems {
  WatchAllItems(this.repository);
  final ItemRepository repository;

  Stream<List<Item>> call() => repository.watchAllItems();
}
