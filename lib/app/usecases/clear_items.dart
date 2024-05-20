import 'package:trackus/app/repositories/repositories.dart';

class ClearItems {
  ClearItems(this.repository);
  final ItemRepository repository;

  Future<void> call() => repository.clearItems();
}
