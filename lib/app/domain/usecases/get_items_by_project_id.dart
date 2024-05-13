import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class GetItemsByProjectId {
  GetItemsByProjectId(
    this.repository,
    this.projectId, {
    required this.includeDone,
  });
  final ItemRepository repository;
  final int projectId;
  final bool includeDone;

  Future<List<Item>> call() => repository.getItemsByProjectId(
        projectId,
        includeDone: includeDone,
      );
}
