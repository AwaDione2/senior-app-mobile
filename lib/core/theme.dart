import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens lifted directly from the SeniorApp mockups
/// (Design canvas: https://claude.ai/artifact/BN7YK3xdDAa8gQY6P1s8ty).
/// Keep this file as the single source of truth for colors/type —
/// screens should never hardcode a hex value.
class AppColors {
  AppColors._();

  static const background = Color(0xFFFBFAF7);
  static const surface = Color(0xFFFFFFFF);
  static const ink = Color(0xFF1F2A24);
  static const mutedText = Color(0xFF6B7A72);
  static const border = Color(0xFFD8D2C4);
  static const borderStrong = Color(0xFFE7E2D8);
  static const primary = Color(0xFF0F5C52);
  static const accent = Color(0xFFC76B3C);
  static const pendingBg = Color(0xFFFBEBD2);
  static const pendingText = Color(0xFF8A5A12);
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final serif = GoogleFonts.sourceSerif4TextTheme();
    final sans = GoogleFonts.publicSansTextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        brightness: Brightness.light,
      ),
      textTheme: sans.copyWith(
        headlineSmall: serif.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        headlineMedium: serif.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        bodyMedium: sans.bodyMedium?.copyWith(color: AppColors.ink),
        bodySmall: sans.bodySmall?.copyWith(color: AppColors.mutedText),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: sans.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(52),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
