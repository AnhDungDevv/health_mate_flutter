import 'package:flutter/material.dart';
import 'package:health_mate/core/config/app_color.dart';
import 'package:health_mate/core/resources/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primaryColorBlue,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: ColorManager.backgroundLight,
      extensions: const [AppColors.light],
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: ColorManager.backgroundLight,
        foregroundColor: ColorManager.textPrimary,
        elevation: 0,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primaryColorBlue,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: ColorManager.backgroundDark,
      extensions: const [AppColors.dark],
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: ColorManager.backgroundDark,
        foregroundColor: ColorManager.white,
        elevation: 0,
      ),
    );
  }
}
