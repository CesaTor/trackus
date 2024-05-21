import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';

class ProjectListViewModel {
  ProjectListViewModel({
    required GetProjects getProjects,
  }) : _getProjects = getProjects;

  final GetProjects _getProjects;

  late final _connectProjects = connect(projects);
  final projects = listSignal<Project>([]);

  void init() => _connectProjects.from(_getProjects());

  void dispose() => _connectProjects.dispose();
}
