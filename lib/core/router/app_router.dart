import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/explorer/route/explorer_route.dart';
import 'package:trackus/features/search/route/search_route.dart';
import 'package:trackus/features/settings/route/settings_route.dart';
import 'package:trackus/lib.dart';

part 'app_router.g.dart';
part 'scaffold_navbar.dart';

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
      _ScaffoldWithNavBar(navigationShell: navigationShell, children: children);
}
