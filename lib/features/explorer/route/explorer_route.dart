import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return ExplorerPage(key: state.pageKey);
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
    );
  }
}

class ExploreAddRouteData extends GoRouteData {
  const ExploreAddRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExplorerAddPage(key: state.pageKey);
  }
}
