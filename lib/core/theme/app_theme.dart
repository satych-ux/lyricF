import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// [AppTheme] manages the visual styling of the application.
/// It provides both light and dark themes using Material 3.
class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.beVietnamProTextTheme().apply(
      bodyColor: AppColors.textMainLight,
      displayColor: AppColors.textMainLight,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textMainLight,
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.beVietnamProTextTheme().apply(
      bodyColor: AppColors.textMainDark,
      displayColor: AppColors.textMainDark,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textMainDark,
    ),
  );
}
