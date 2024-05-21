import 'package:signals/signals.dart';
import 'package:trackus/_shared/_shared.dart';

class ExploreAddTaskViewModel {
  ExploreAddTaskViewModel({
    required GetProjects getProjects,
  }) : _getProjects = getProjects;

  final GetProjects _getProjects;

  final pickedColor = signal(defaultProject.colorValue.color);
  final projectName = signal('');
  final isFavorite = signal(false);
  final layout = signal(Layout.list);
  final parentProject = signal<Project?>(null);

  late final _connectProjects = connect(projects);
  final projects = listSignal<Project>([]);

  void init() {
    _connectProjects.from(_getProjects());
  }

  Project get project => Project(
        name: projectName.peek(),
        colorValue: pickedColor.peek().value,
        isFavorite: isFavorite.peek(),
        layout: layout.peek(),
        parent: parentProject.peek(),
      );

  void dispose() => _connectProjects.dispose();
}
