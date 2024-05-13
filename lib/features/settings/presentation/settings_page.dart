import 'package:flutter/material.dart';
import 'package:trackus/features/settings/route/settings_route.dart';
import 'package:trackus/lib.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            ListTile(
              title: const Text('Backup&Restore'),
              onTap: () => const SettingsBackupRouteData().push<void>(context),
            ),
          ],
        ),
      ),
    );
  }
}
