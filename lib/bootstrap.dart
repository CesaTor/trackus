import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here --------------------------------
  // Require flutter bridge initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize i18n
  LocaleSettings.useDeviceLocale();

  // Initialize Database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ItemSchema, ProjectSchema],
    directory: dir.path,
  );

  // Initialize default project
  await isar.writeTxn(() => isar.projects.put(defaultProject));

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ItemRepository>(
          create: (_) => ItemRepositoryImpl(isar),
        ),
        RepositoryProvider<Isar>(create: (_) => isar),
      ],
      child: TranslationProvider(child: await builder()),
    ),
  );
}
