import 'package:flutter_test/flutter_test.dart';
import 'package:fracttal_one/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FracttalApp());
    expect(find.text('Siguiente'), findsOneWidget);
  });
}
