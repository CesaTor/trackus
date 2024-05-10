import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class InsertTodayItem {
  InsertTodayItem(this.repository);
  final ItemRepository repository;

  Future<Item> call(Item item) async {
    final id = await repository.insertItem(item);
    return item.copyWith(id: id);
  }
}
