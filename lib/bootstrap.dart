import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/_shared/data/source/database/database.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (e) => log(e.exceptionAsString(), stackTrace: e.stack);

  // Add cross-flavor configuration here --------------------------------
  // Require flutter bridge initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize i18n
  LocaleSettings.useDeviceLocale();

  // Initialize Database
  final db = await Database(
    (await getApplicationDocumentsDirectory()).path,
    postInit: [
      // Initialize default project
      (isar) => isar.writeTxnSync(() => isar.projects.putSync(defaultProject)),
    ],
  ).init();
  sl.registerSingleton(db);

  // Initialize Repositories
  sl.registerSingleton(TasksRepositoryImpl(db));
  sl.registerSingleton(ProjectsRepositoryImpl(db));

  // Run app
  runApp(TranslationProvider(child: await builder()));
}
