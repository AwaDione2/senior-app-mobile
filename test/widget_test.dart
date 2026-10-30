import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:senior_app/main.dart';

void main() {
  testWidgets('App boots to the Connexion screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: SeniorApp()));
    await tester.pumpAndSettle();

    expect(find.text('SeniorApp'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
