import 'package:flutter_test/flutter_test.dart';
import 'package:trackus/app/app.dart';
import 'package:trackus/features/home/presentation/pages/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Home), findsOneWidget);
    });
  });
}
