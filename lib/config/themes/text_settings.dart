import 'package:flutter/material.dart';

import '../../core/Strings/app_colors.dart';

TextTheme textSettings = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: AppColors.blackTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: AppColors.blackTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 32,
      color: AppColors.blackTextColor,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.blackTextColor,
      fontFamily: 'customArabic',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.blackTextColor,
      fontFamily: 'customArabic',
    ));
