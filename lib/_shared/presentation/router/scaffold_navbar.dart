import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/_shared/_shared.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in a custom container
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children.elementAt(navigationShell.currentIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onTap,
        selectedIndex: navigationShell.currentIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.today),
            icon: const Icon(Icons.today_outlined),
            label: i18n.core.navbar.today,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.inbox),
            icon: const Icon(Icons.inbox_outlined),
            label: i18n.core.navbar.inbox,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.search),
            icon: const Icon(Icons.search_outlined),
            label: i18n.core.navbar.search,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.menu),
            icon: const Icon(Icons.menu_outlined),
            label: i18n.core.navbar.explore,
          ),
        ],
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index
  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
