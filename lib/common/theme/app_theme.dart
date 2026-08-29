import 'package:flutter/material.dart';

/// Design tokens extraídos do Figma (assets/Button.svg, Button.jpg, Size.svg).
class AppColors {
  // Primary palette
  static const navy = Color(0xFF131927);
  static const primary = Color(0xFF4A6CF7);
  static const primaryLight = Color(0xFF7B9AFF);
  static const primaryContainer = Color(0xFFD6E0FF);

  // Neutral
  static const white = Color(0xFFFFFFFF);
  static const disabled = Color(0xFFB0B0B0);
  static const disabledContainer = Color(0xFFE0E0E0);
  static const disabledText = Color(0xFF9E9E9E);

  // Surface
  static const surface = Color(0xFFF5F5F5);
  static const onSurface = Color(0xFF1C1B1F);
}

class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

class AppBorderRadius {
  static const sm = 6.0;
  static const md = 10.0;
  static const lg = 14.0;
  static const xl = 18.0;
  static const full = 999.0;
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
      ),
      scaffoldBackgroundColor: AppColors.surface,
    );
  }
}
