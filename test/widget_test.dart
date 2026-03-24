import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_flow/main.dart';
import 'package:lyric_flow/core/di/injection.dart' as di;
import 'package:lyric_flow/features/auth/presentation/bloc/auth_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setupFirebaseCoreMocks();
    await Firebase.initializeApp();

    // LyricFlowApp reads blocs from GetIt; tests must initialize DI first.
    if (!di.sl.isRegistered<AuthBloc>()) {
      await di.init();
    }
  });

  testWidgets('App smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build our app and trigger a frame.
    // We need to pump and wait for DI to finish if it's async,
    // but in main.dart we await di.init() before runApp.
    // However, in tests, we might need a separate setup.
    // For a simple smoke test, we just check if the app builds.

    await tester.pumpWidget(const LyricFlowApp());
    expect(find.byType(LyricFlowApp), findsOneWidget);
  });
}
