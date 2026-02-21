import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/voice_capture/presentation/screens/voice_capture_screen.dart';
import '../../features/lyrics/presentation/screens/generated_lyrics_screen.dart';
import '../../features/creator/presentation/screens/creator_mode_screen.dart';

/// Routes identifiers
class AppRoutes {
  static const String voiceCapture = '/';
  static const String generatedLyrics = '/lyrics';
  static const String creatorMode = '/creator';
}

/// Provider for the [GoRouter].
/// Handles navigation state and deep linking.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.voiceCapture,
    routes: [
      GoRoute(
        path: AppRoutes.voiceCapture,
        builder: (context, state) => const VoiceCaptureScreen(),
      ),
      GoRoute(
        path: AppRoutes.generatedLyrics,
        builder: (context, state) => const GeneratedLyricsScreen(),
      ),
      GoRoute(
        path: AppRoutes.creatorMode,
        builder: (context, state) => const CreatorModeScreen(),
      ),
    ],
  );
});
