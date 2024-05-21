import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/_shared/presentation/router/scaffold_navbar.dart';
import 'package:trackus/features/features.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
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
    TypedStatefulShellBranch<SearchData>(
      routes: [TypedGoRoute<SearchRouteData>(path: '/search')],
    ),
    TypedStatefulShellBranch<ExplorerData>(
      routes: [
        TypedGoRoute<ExplorerRouteData>(
          path: '/explorer',
          routes: [
            TypedGoRoute<ExploreAddRouteData>(path: 'project/add'),
            TypedGoRoute<ExploreProjectIdRouteData>(path: 'project/:id'),
          ],
        ),
        TypedGoRoute<SettingsRouteData>(
          path: '/settings',
          routes: [TypedGoRoute<SettingsBackupRouteData>(path: 'backup')],
        ),
      ],
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
      ScaffoldWithNavBar(navigationShell: navigationShell, children: children);
}
