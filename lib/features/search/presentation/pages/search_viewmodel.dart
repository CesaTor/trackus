import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/search/domain/usecases/search.dart';

class SearchViewModel {
  SearchViewModel({
    required Search search,
    required UpdateTask updateTask,
  })  : _search = search,
        _updateTask = updateTask;

  final Search _search;
  final UpdateTask _updateTask;

  final projects = listSignal<Project>([]);
  final tasks = listSignal<Task>([]);

  Future<void> search(String query) async {
    final res = await _search(query);
    tasks.value = res.items;
    projects.value = res.projects;
  }

  void markTaskAsCompleted(Task task, {bool completed = true}) {
    _updateTask(task.copyWith(isDone: completed));
  }
}
