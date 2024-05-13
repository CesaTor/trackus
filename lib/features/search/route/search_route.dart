import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/search/presentation/pages/search_page.dart';

// Data
class SearchData extends StatefulShellBranchData {
  const SearchData();
}

// Route
class SearchRouteData extends GoRouteData {
  const SearchRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchPage(key: state.pageKey);
  }
}
