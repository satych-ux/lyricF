import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_flow/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We need to pump and wait for DI to finish if it's async,
    // but in main.dart we await di.init() before runApp.
    // However, in tests, we might need a separate setup.
    // For a simple smoke test, we just check if the app builds.

    await tester.pumpWidget(const LyricFlowApp());
    expect(find.byType(LyricFlowApp), findsOneWidget);
  });
}
