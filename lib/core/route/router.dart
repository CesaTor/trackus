import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/core/route/scaffold_navbar.dart';
import 'package:trackus/features/today/today.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: '/today',
);

@TypedStatefulShellRoute<ShellData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
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
      ScaffoldWithNavBar(navigationShell: navigationShell, children: children);
}

class InboxData extends StatefulShellBranchData {
  const InboxData();

  static final GlobalKey<NavigatorState> $navigatorKey = _sectionANavigatorKey;
}

class InboxRouteData extends GoRouteData {
  const InboxRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailsScreen(label: 'B');
  }
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    this.extra,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  /// Optional param
  final String? param;

  /// Optional extra object
  final Object? extra;
  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
      ),
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Details for ${widget.label} - Counter: $_counter',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.param != null)
            Text(
              'Parameter: ${widget.param!}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.extra != null)
            Text(
              'Extra: ${widget.extra!}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
        ],
      ),
    );
  }
}
