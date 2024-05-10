import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class AppProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('didAddProvider(${provider.runtimeType}, $value)');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('providerDidFail(${provider.runtimeType}, $error, $stackTrace)');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      'didUpdateProvider(${provider.runtimeType}, $previousValue, $newValue)',
    );
  }

  /// A provider was disposed
  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('didDisposeProvider(${provider.runtimeType})');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here --------------------------------
  // Require flutter bridge initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize i18n
  LocaleSettings.useDeviceLocale();

  // Initialize Database

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ItemRepository>(
            create: (context) => ItemRepository(isar),
          ),
          RepositoryProvider<Isar>(
            create: (context) => isar,
          ),
        ],
        child: TranslationProvider(child: await builder()),
      ),
    ),
  );
}
