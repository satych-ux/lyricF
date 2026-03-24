import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/theme/app_theme.dart';
import 'core/navigation/app_router.dart';
import 'core/di/injection.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/lyrics/presentation/bloc/lyrics_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Initialize Dependency Injection
  await di.init();
  
  runApp(const LyricFlowApp());
}

/// [LyricFlowApp] initializes the application with the defined design system
/// and navigation router, providing global Blocs.
class LyricFlowApp extends StatelessWidget {
  const LyricFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>(),
        ),
        BlocProvider<LyricsBloc>(
          create: (_) => di.sl<LyricsBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'LyricFlow',
        debugShowCheckedModeBanner: false,
        
        // Theme Configuration
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,

        // Navigation Configuration (Using GoRouter)
        routerConfig: appRouter,
      ),
    );
  }
}
