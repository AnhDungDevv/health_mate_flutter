import 'package:flutter/material.dart';
import 'package:health_mate/shared/styles/colors.dart';
import 'package:health_mate/shared/styles/typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1,
      bodyLarge: AppTypography.bodyText1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: AppTypography.buttonText,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1.copyWith(color: Colors.white),
      bodyLarge: AppTypography.bodyText1.copyWith(color: Colors.white70),
    ),
  );
}
