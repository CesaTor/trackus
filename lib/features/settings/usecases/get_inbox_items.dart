import 'package:trackus/app/app.dart';

class GetInboxItems {
  GetInboxItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getInboxItems();
}
