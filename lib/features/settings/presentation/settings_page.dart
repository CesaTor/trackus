import 'package:flutter/material.dart';
import 'package:trackus/features/settings/route/settings_route.dart';
import 'package:trackus/lib.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(i18n.settings.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            ListTile(
              title: Text(i18n.settings.backupAndRestore),
              onTap: () => const SettingsBackupRouteData().push<void>(context),
            ),
          ],
        ),
      ),
    );
  }
}
