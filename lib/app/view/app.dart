import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/home/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => ItemsCubit(
        getAllItems: GetAllItems(ItemRepositoryImpl(c.read<Isar>())),
        insertItem: InsertItem(ItemRepositoryImpl(c.read<Isar>())),
        clearItems: ClearItems(ItemRepositoryImpl(c.read<Isar>())),
      )..init(),
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: const Home(),
      ),
    );
  }
}
