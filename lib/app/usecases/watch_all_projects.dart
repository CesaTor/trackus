import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/repositories/repositories.dart';

class WatchAllProjects {
  WatchAllProjects(this.repository);
  final ItemRepository repository;

  Stream<List<Project>> call() => repository.watchAllProjects();
}
