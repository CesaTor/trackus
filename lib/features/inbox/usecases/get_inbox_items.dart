import 'package:trackus/_shared/_shared.dart';

class GetInboxItems {
  GetInboxItems(this.repository);
  final TasksRepository repository;

  Future<List<Task>> call() => repository.getAll();
}
