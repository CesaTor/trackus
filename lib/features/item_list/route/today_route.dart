import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/today/presentation/today_page.dart';

// Data
class TodayData extends StatefulShellBranchData {
  const TodayData();
}

// Route
class TodayRouteData extends GoRouteData {
  const TodayRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TodayPage(key: state.pageKey);
  }
}
