import 'package:trackus/lib.dart';

class GetInboxItems {
  GetInboxItems(this.repository);
  final ItemRepository repository;

  Future<List<Item>> call() => repository.getInboxItems(includeDone: true);
}
