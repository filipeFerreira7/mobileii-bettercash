import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  static const tabLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.tabLabelDefault,
  );

  static const listItemTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.listItemTextPrimary,
  );

  static const listItemDetails = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.listItemTextSecondary,
  );

  static const progressBarLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.progressBarText,
  );

  // Avatar
  static const avatarInitial = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // Badge & Chip
  static const badgeLabelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const badgeLabelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static const badgeLabelTiny = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  // Card
  static const cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
  );
  static const cardDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey500,
  );

  // Alert
  static const alertTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const alertDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
