import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class InsertTodayItem {
  InsertTodayItem(this.repository);
  final ItemRepository repository;

  Future<Item> call(Item item) async {
    final id = await repository.insertItem(item);

    final savedItem = await repository.getItem(id);

    return savedItem ?? item.copyWith(id: id);
  }
}
