import 'package:trackus/app/app.dart';

class ClearItems {
  ClearItems(this.repository);
  final ItemRepository repository;

  Future<void> call() => repository.clearItems();
}
