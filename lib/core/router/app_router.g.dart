// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $shellData,
    ];

RouteBase get $shellData => StatefulShellRouteData.$route(
      navigatorContainerBuilder: ShellData.$navigatorContainerBuilder,
      factory: $ShellDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/today',
              factory: $TodayRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/inbox',
              factory: $InboxRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/search',
              factory: $SearchRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ShellDataExtension on ShellData {
  static ShellData _fromState(GoRouterState state) => const ShellData();
}

extension $TodayRouteDataExtension on TodayRouteData {
  static TodayRouteData _fromState(GoRouterState state) =>
      const TodayRouteData();

  String get location => GoRouteData.$location(
        '/today',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $InboxRouteDataExtension on InboxRouteData {
  static InboxRouteData _fromState(GoRouterState state) =>
      const InboxRouteData();

  String get location => GoRouteData.$location(
        '/inbox',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteDataExtension on SearchRouteData {
  static SearchRouteData _fromState(GoRouterState state) =>
      const SearchRouteData();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
