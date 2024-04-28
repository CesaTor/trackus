import 'package:trackus/core/feature/domain/domain.dart';

class ClearItems {
  ClearItems(this.repository);
  final ItemRepository repository;

  Future<void> call() => repository.clearItems();
}
