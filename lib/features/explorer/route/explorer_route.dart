import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/explorer/explorer.dart';

// Data
class ExplorerData extends StatefulShellBranchData {
  const ExplorerData();
}

// Routes
class ExplorerRouteData extends GoRouteData {
  const ExplorerRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExplorerPage(
      key: state.pageKey,
      viewmodel: ExploreViewModel(
        addProject: AddProject(projectRepo),
        getProjects: GetProjects(projectRepo),
      ),
    );
  }
}

class ExploreProjectIdRouteData extends GoRouteData {
  const ExploreProjectIdRouteData(this.id);

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExploreProjectPage(
      projectId: id,
      key: state.pageKey,
      viewModel: ExploreProjectViewModel(
        updateProject: UpdateProject(projectRepo),
        addProject: AddProject(projectRepo),
        deleteProject: DeleteProject(projectRepo),
        watchProject: WatchSingleProject(projectRepo, id),
      ),
    );
  }
}

class ExploreAddRouteData extends GoRouteData {
  const ExploreAddRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExplorerAddPage(
      key: state.pageKey,
      viewmodel: ExploreAddTaskViewModel(
        getProjects: GetProjects(projectRepo),
      ),
    );
  }
}
