import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/app_router.dart';

/// [main] is the entry point of the application.
/// We wrap the root widget in a [ProviderScope] to enable Riverpod state management.
void main() {
  runApp(
    const ProviderScope(
      child: LyricFlowApp(),
    ),
  );
}

/// [LyricFlowApp] initializes the application with the defined design system
/// and navigation router.
class LyricFlowApp extends ConsumerWidget {
  const LyricFlowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider to get the GoRouter instance
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'LyricFlow',
      debugShowCheckedModeBanner: false,
      
      // Theme Configuration
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      // Navigation Configuration (Using GoRouter)
      routerConfig: goRouter,
    );
  }
}

// ==========================================
// ARCHITECTURE OVERVIEW:
// ==========================================
// This app follows a Hybrid Clean Architecture (Feature-First):
//
// 📁 core/
//    - network/      : Dio client configuration
//    - navigation/   : GoRouter definitions
//    - theme/        : App colors and theme data
//    - widgets/      : Reusable UI components (Atoms/Molecules)
//
// 📁 features/ (Each feature is self-contained)
//    - domain/       : Models (Freezed) and Business Logic
//    - data/         : Repositories and Data Sources
//    - presentation/ : Screens, Widgets, and State (Riverpod Notifiers)
//
// 💡 ADVANTAGES:
// 1. Modularity: Features can be developed and tested independently.
// 2. Scalability: Easy to add new features without bloating main.dart.
// 3. Testability: Logic is separated from UI.
// 4. Investor Friendly: Standard modern stack (Riverpod, Freezed, GoRouter).
// ==========================================