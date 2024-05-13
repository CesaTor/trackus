import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => AppCubit(
        getAllItems: GetAllItems(c.read()),
        clearItems: ClearItems(c.read()),
        deleteItemById: DeleteItemById(c.read()),
      )..init(),
      child: MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        routerConfig: appRouter,
      ),
    );
  }
}
