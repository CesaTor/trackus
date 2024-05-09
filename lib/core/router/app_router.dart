import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/inbox/inbox.dart';
import 'package:trackus/features/today/today.dart';

part 'app_router.g.dart';
part 'scaffold_navbar.dart';

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: '/today',
);

@TypedStatefulShellRoute<ShellData>(
  branches: [
    TypedStatefulShellBranch<TodayData>(
      routes: [TypedGoRoute<TodayRouteData>(path: '/today')],
    ),
    TypedStatefulShellBranch<InboxData>(
      routes: [TypedGoRoute<InboxRouteData>(path: '/inbox')],
    ),
  ],
)
class ShellData extends StatefulShellRouteData {
  const ShellData();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      navigationShell;

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) =>
      _ScaffoldWithNavBar(navigationShell: navigationShell, children: children);
}
