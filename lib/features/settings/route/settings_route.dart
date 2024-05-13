import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/settings/settings.dart';

// Routes
class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsPage(key: state.pageKey);
  }
}

class SettingsBackupRouteData extends GoRouteData {
  const SettingsBackupRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsBackupPage(key: state.pageKey);
  }
}
