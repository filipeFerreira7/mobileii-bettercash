import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const primary = Color(0xFF4A6CF7);
  static const primaryHover = Color(0x1A4A6CF7); // 10% opacity
  static const primaryFocus = Color(0xFF4A6CF7);
  static const primarySelected = Color(0xFF4A6CF7);
  
  // Semantic Colors
  static const success = Color(0xFF22C55E);
  static const info = Color(0xFF0EA5E9);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);

  // Semantic Colors Light (for outline/light backgrounds)
  static const successLight = Color(0xFFF0FDF4);
  static const infoLight = Color(0xFFF0F9FF);
  static const warningLight = Color(0xFFFFFBEB);
  static const errorLight = Color(0xFFFEF2F2);
  static const primaryLightest = Color(0xFFF5F7FF);
  
  // Neutral / Background
  static const white = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF5F5F5);
  static const onSurface = Color(0xFF1C1B1F);
  static const grey100 = Color(0xFFF3F4F6);
  static const grey200 = Color(0xFFE5E7EB);
  static const grey300 = Color(0xFFD1D5DB);
  static const grey400 = Color(0xFF9CA3AF);
  static const grey500 = Color(0xFF6B7280);
  
  // Disabled
  static const disabled = Color(0xFFB0B0B0);
  static const disabledText = Color(0xFF9E9E9E);

  static const navy = Color(0xFF131927);
  static const disabledContainer = Color(0xFFE0E0E0);
  
  // States Specific
  static const listItemBackgroundDefault = Color(0xFFF9F9F9);
  static const listItemBackgroundHover = Color(0xFFF1F4FF);
  static const listItemBackgroundSelected = primary;
  static const listItemBackgroundDisabled = Color(0xFFF5F5F5);
  
  static const listItemTextPrimary = Color(0xFF131927);
  static const listItemTextSecondary = Color(0xFF6B7280);
  static const listItemTextSelected = white;
  static const listItemTextDisabled = Color(0xFF9CA3AF);

  static const tabLabelDefault = primary;
  static const tabLabelSelected = white;
  static const tabLabelDisabled = disabledText;
  
  static const tabIconDefault = primary;
  static const tabIconSelected = white;
  static const tabIconDisabled = disabledText;
  
  static const tabBackgroundHover = primaryHover;
  static const tabBackgroundSelected = primarySelected;
  static const tabBackgroundTransparent = Colors.transparent;
  
  static const tabBorderFocus = primaryFocus;

  // Progress Bar
  static const progressBarRail = Color(0xFFE9ECEF);
  static const progressBarRailHover = Color(0xFFDEE2E6);
  static const progressBarFill = primary;
  static const progressBarFillHover = Color(0xFF3B5BDB);
  static const progressBarFillActive = Color(0xFF2B45B4);
  static const progressBarText = Color(0xFF495057);
  static const progressBarDisabled = Color(0xFFCED4DA);

  // Avatar & Badge
  static const statusOnline = Color(0xFF22C55E);
  static const statusOffline = Color(0xFF9CA3AF);
}
