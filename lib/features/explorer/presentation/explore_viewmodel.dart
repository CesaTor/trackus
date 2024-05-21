import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';

class ExploreViewModel {
  ExploreViewModel({
    required GetProjects getProjects,
    required AddProject addProject,
  })  : _getProjects = getProjects,
        _addProject = addProject;

  final GetProjects _getProjects;
  final AddProject _addProject;

  late final _connectProjects = connect(projects);
  final projects = listSignal<Project>([]);

  void init() => _connectProjects.from(_getProjects());

  Future<Project> addProject(Project project) =>
      _addProject.call(project: project);

  void dispose() => _connectProjects.dispose();
}
