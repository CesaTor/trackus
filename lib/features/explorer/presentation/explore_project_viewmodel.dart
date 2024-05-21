import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';

class ExploreProjectViewModel {
  ExploreProjectViewModel({
    required WatchSingleProject watchProject,
    required DeleteProject deleteProject,
    required UpdateProject updateProject,
    required AddProject addProject,
  })  : _deleteProject = deleteProject,
        _updateProject = updateProject,
        _addProject = addProject,
        _watchProject = watchProject;

  final AddProject _addProject;
  final UpdateProject _updateProject;
  final DeleteProject _deleteProject;
  final WatchSingleProject _watchProject;

  late final _connectProject = connect(project);
  final project = signal<Project?>(null);

  void init() {
    _connectProject.from(_watchProject());
  }

  void deleteProject(Project project) {
    final id = project.id;
    if (id != null) _deleteProject(id);
  }

  void addProject(Project project) => _addProject(project: project);

  void editProject(Project project) => _updateProject(project);

  void dispose() => _connectProject.dispose();
}
