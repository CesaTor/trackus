import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trackus/core/core.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: widget,
      ),
    );
  }
}
