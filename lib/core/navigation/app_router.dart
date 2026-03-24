import 'package:go_router/go_router.dart';
import '../../features/voice_capture/presentation/screens/voice_capture_screen.dart';
import '../../features/lyrics/presentation/screens/generated_lyrics_screen.dart';
import '../../features/lyrics/presentation/screens/saved_generations_screen.dart';
import '../../features/creator/presentation/screens/creator_mode_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String voiceCapture = '/home';
  static const String generatedLyrics = '/lyrics';
  static const String myGenerations = '/library';
  static const String creatorMode = '/creator';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.voiceCapture,
      builder: (context, state) => const VoiceCaptureScreen(),
    ),
    GoRoute(
      path: AppRoutes.generatedLyrics,
      builder: (context, state) => const GeneratedLyricsScreen(),
    ),
    GoRoute(
      path: AppRoutes.myGenerations,
      builder: (context, state) => const SavedGenerationsScreen(),
    ),
    GoRoute(
      path: AppRoutes.creatorMode,
      builder: (context, state) => const CreatorModeScreen(),
    ),
  ],
);
