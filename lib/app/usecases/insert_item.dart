import 'package:trackus/app/app.dart';

class InsertItem {
  InsertItem(this.repository);
  final ItemRepository repository;

  Future<Item> call(Item item) async {
    final id = await repository.insertItem(item);
    return item.copyWith(id: id);
  }
}
