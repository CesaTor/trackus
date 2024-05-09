part of 'app_router.dart';

class _ScaffoldWithNavBar extends StatelessWidget {
  const _ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in a custom container
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children.elementAt(navigationShell.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
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
