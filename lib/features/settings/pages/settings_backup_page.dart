import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class SettingsBackupPage extends StatelessWidget {
  const SettingsBackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backup&Restore')),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Backup'),
            onTap: () => createBackup(context),
          ),
          ListTile(
            title: const Text('Restore from backup'),
            onTap: () => restoreBackup(context),
          ),
        ],
      ),
    );
  }

  Future<void> createBackup(BuildContext context) async {
    final isar = context.read<Isar>();

    final backUpDir = await FilePicker.platform.getDirectoryPath();
    if (backUpDir == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not create backup, please check your storage'),
        ),
      );
      return;
    }

    final fileName =
        'trackus-${DateFormat('yyyy-MM-dd-HH-mm').format(DateTime.now())}.db';
    final filePath = '$backUpDir/$fileName';

    final backUpFile = File(filePath);

    // if already we have another backup file, delete it here.
    if (backUpFile.existsSync()) await backUpFile.delete();

    await isar.copyToFile(filePath);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Backup created at $filePath')),
      );
    }
  }

  Future<void> restoreBackup(BuildContext context) async {
    final isar = context.read<Isar>();

    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      final dbDirectory = await getApplicationDocumentsDirectory();
      // close the database before any changes
      await isar.close();

      final dbPath = '${dbDirectory.path}/default.isar';

      await file.copy(dbPath);
      // Restart the app to reload the database
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Backup restored, restart the app to see changes!'),
          ),
        );
      }
    }
  }
}
