import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/explorer/explorer.dart';
import 'package:trackus/lib.dart';

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

class ExploreProjectRouteData extends GoRouteData {
  const ExploreProjectRouteData();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;

    return ExploreProjectIdRouteData(id).location;
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
