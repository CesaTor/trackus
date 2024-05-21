import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';

class TaskListViewModel {
  TaskListViewModel({
    required GetTasks getTasks,
    required DeleteTask deleteTask,
    required UpdateTask updateTask,
    required AddTask addTask,
    required GetProjects getProjects,
  })  : _getTasks = getTasks,
        _deleteTask = deleteTask,
        _updateTask = updateTask,
        _addTask = addTask,
        _getProjects = getProjects;

  final GetTasks _getTasks;
  final AddTask _addTask;
  final UpdateTask _updateTask;
  final DeleteTask _deleteTask;
  final GetProjects _getProjects;

  late final _connectTasks = connect(tasks);
  final tasks = listSignal<Task>([]);

  late final _connectProjects = connect(projects);
  final projects = listSignal<Project>([]);

  void init() {
    // update the list of tasks when the tasks are fetched
    _connectTasks.from(_getTasks());
    // update the list of projects when the projects are fetched
    _connectProjects.from(_getProjects());
  }

  void deleteTask(Task task) {
    final id = task.id;
    if (id != null) _deleteTask(id);
  }

  void addTask(Task task) => _addTask(task: task);

  void editTask(Task task) => _updateTask(task);

  void markTaskAsCompleted(Task task, {bool completed = true}) {
    _updateTask(task.copyWith(isDone: completed));
  }

  void dispose() => _connectTasks.dispose();
}
