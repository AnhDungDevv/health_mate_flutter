import 'dart:ui';

import 'package:health_mate/core/config/color_theme_extension.dart';
import 'package:health_mate/core/resources/color_manager.dart';

class AppColors {
  static const light = ColorThemeExtension(
    primaryBlue: ColorManager.primaryColorBlue,
    amber: Color.fromRGBO(255, 193, 7, 1),
    secondaryColorOrange: ColorManager.secondaryColorOrange,
    green: ColorManager.successColor,
    white: ColorManager.white,
    black: ColorManager.black,
    grey: ColorManager.gray,
    darkGrey: ColorManager.darkGray,
    lightGrey: ColorManager.lightGray,
    veryLightGrey: ColorManager.veryLightGray,
    darkGreen: ColorManager.darkGreen,
    paleYellow: ColorManager.paleYellow,
    textPrimary: ColorManager.textPrimary,
    textSecondary: ColorManager.textSecondary,
    textLight: ColorManager.textLight,
    textDark: ColorManager.textDark,
    backgroundLight: ColorManager.backgroundLight,
    backgroundDark: ColorManager.backgroundDark,
    backgroundGrey: ColorManager.backgroundGray, // updated
    transparent: ColorManager.transparent,
    shimmerLightGrey: ColorManager.shimmerLightGray, // updated
    shimmerDarkGrey: ColorManager.shimmerDarkGray, // updated
    lowOpacityGrey: ColorManager.lowOpacityGray, // updated
    veryLowOpacityGrey: ColorManager.veryLowOpacityGray, // updated
    lightBlack: ColorManager.lightBlack,
    darkWhite: ColorManager.lightWhite, // updated
    lightPink: ColorManager.lightPink,
    mintGreen: ColorManager.mintGreen,
    pinkish: ColorManager.pinkish,
    softYellow: ColorManager.softYellow,
    lightBlue: ColorManager.lightBlue,
    buttonColor: ColorManager.primaryButtonColor, // updated
    buttonHover: ColorManager.buttonHoverColor, // updated
    lightDarkGray: ColorManager.darkBackgroundGray, // updated
    black54: ColorManager.black54,
  );

  // If you have a dark theme, you can adjust colors here
  static const dark = light; // Or clone and adjust colors if necessary
}
