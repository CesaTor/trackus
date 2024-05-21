import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/search/search.dart';

// Data
class SearchData extends StatefulShellBranchData {
  const SearchData();
}

// Route
class SearchRouteData extends GoRouteData {
  const SearchRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchView(
      key: state.pageKey,
      viewModel: SearchViewModel(
        search: Search(taskRepo, projectRepo),
        updateTask: UpdateTask(taskRepo),
      ),
    );
  }
}
