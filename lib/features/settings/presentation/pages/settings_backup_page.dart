import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackus/lib.dart';

class SettingsBackupPage extends StatelessWidget {
  const SettingsBackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(i18n.settings.backupAndRestore)),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(i18n.settings.backup),
            onTap: () => createBackup(context),
          ),
          ListTile(
            title: Text(i18n.settings.restore),
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
        SnackBar(content: Text(i18n.settings.error.creation)),
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
        SnackBar(
          content: Text(i18n.settings.message.created(FilePath: filePath)),
        ),
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
          SnackBar(content: Text(i18n.settings.message.restored)),
        );
      }
    }
  }
}
