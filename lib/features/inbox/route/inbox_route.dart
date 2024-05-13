import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/inbox/inbox.dart';

// Data
class InboxData extends StatefulShellBranchData {
  const InboxData();
}

// Route
class InboxRouteData extends GoRouteData {
  const InboxRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return InboxPage(key: state.pageKey);
  }
}
