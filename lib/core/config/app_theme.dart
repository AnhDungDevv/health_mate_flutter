import 'package:flutter/material.dart';
import 'package:health_mate/core/resources/color_manager.dart';
import 'package:health_mate/core/resources/font_manager.dart';
import 'package:health_mate/core/resources/styles_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorManager.primaryBlue,
      primaryColorLight: ColorManager.lightGrey,
      primarySwatch: Colors.blue,
      hintColor: ColorManager.lowOpacityGrey,
      shadowColor: ColorManager.veryLowOpacityGrey,
      focusColor: ColorManager.textPrimary,
      disabledColor: ColorManager.textLight,
      hoverColor: ColorManager.transparent,
      indicatorColor: ColorManager.textPrimary,
      dividerColor: ColorManager.veryLightGrey,
      cardColor: ColorManager.lightBlack,
      scaffoldBackgroundColor: ColorManager.white,
      iconTheme: const IconThemeData(color: ColorManager.textPrimary),
      chipTheme:
          const ChipThemeData(backgroundColor: ColorManager.veryLowOpacityGrey),
      highlightColor: ColorManager.lowOpacityGrey,
      canvasColor: ColorManager.transparent,
      splashColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: ColorManager.backgroundLight,
        shadowColor: ColorManager.white,
        iconTheme: const IconThemeData(color: ColorManager.textPrimary),
        titleTextStyle: getNormalStyle(
            fontSize: FontSize.s16, color: ColorManager.textPrimary),
      ),
      textTheme: TextTheme(
        bodyLarge: getNormalStyle(color: ColorManager.textPrimary),
        bodyMedium: getNormalStyle(color: ColorManager.textSecondary),
        bodySmall: getNormalStyle(color: ColorManager.textLight),
        displayLarge:
            getNormalStyle(color: ColorManager.textSecondary, fontSize: 15),
        displayMedium:
            getBoldStyle(color: ColorManager.textPrimary, fontSize: 15),
        displaySmall:
            getMediumStyle(color: ColorManager.textPrimary, fontSize: 15),
        headlineSmall: getNormalStyle(color: ColorManager.shimmerLightGrey),
        titleLarge: getNormalStyle(color: ColorManager.white),
        titleSmall: getNormalStyle(color: ColorManager.darkWhite),
        titleMedium: getNormalStyle(color: ColorManager.lightGrey),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: ColorManager.black,
      primaryColorLight: ColorManager.black54,
      primarySwatch: Colors.grey,
      hintColor: ColorManager.darkGrey,
      shadowColor: ColorManager.darkGrey,
      focusColor: ColorManager.white,
      highlightColor: ColorManager.grey,
      hoverColor: ColorManager.transparent,
      indicatorColor: ColorManager.grey,
      dividerColor: ColorManager.grey,
      iconTheme: const IconThemeData(color: ColorManager.white),
      chipTheme:
          const ChipThemeData(backgroundColor: ColorManager.lightDarkGray),
      cardColor: ColorManager.darkGrey,
      disabledColor: ColorManager.white,
      scaffoldBackgroundColor: ColorManager.backgroundDark,
      canvasColor: ColorManager.transparent,
      splashColor: ColorManager.darkGrey,
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorManager.white),
        color: ColorManager.backgroundDark,
        shadowColor: ColorManager.lowOpacityGrey,
        titleTextStyle:
            getNormalStyle(fontSize: FontSize.s16, color: ColorManager.white),
      ),
      textTheme: TextTheme(
        bodyLarge: getNormalStyle(color: ColorManager.white),
        bodyMedium: getNormalStyle(color: ColorManager.darkGrey),
        bodySmall: getNormalStyle(color: ColorManager.lightGrey),
        displayLarge: getNormalStyle(color: ColorManager.grey, fontSize: 15),
        displayMedium: getBoldStyle(color: ColorManager.white, fontSize: 15),
        displaySmall: getMediumStyle(color: ColorManager.white, fontSize: 15),
        headlineSmall: getNormalStyle(color: Colors.grey[500]!),
        titleLarge: getNormalStyle(color: ColorManager.shimmerDarkGrey),
        titleSmall: getNormalStyle(color: ColorManager.darkGrey),
        titleMedium: getNormalStyle(color: ColorManager.darkGrey),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
    );
  }
}
