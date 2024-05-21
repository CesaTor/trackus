import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/repositories.dart';

class WatchItemsByProject {
  WatchItemsByProject(this.repository);
  final ItemRepository repository;

  Stream<List<Item>> call(int projectId) =>
      repository.watchItemsByProject(projectId);
}
