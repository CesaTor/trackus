import 'package:trackus/app/domain/domain.dart';
import 'package:trackus/core/core.dart';

class WatchAllItems {
  WatchAllItems(this.repository);
  final ItemRepository repository;

  Stream<List<Item>> call() => repository.watchAllItems();
}
