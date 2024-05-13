import 'package:trackus/app/domain/domain.dart';
import 'package:trackus/core/core.dart';

class WatchAllProjects {
  WatchAllProjects(this.repository);
  final ItemRepository repository;

  Stream<List<Project>> call() => repository.watchAllProjects();
}
