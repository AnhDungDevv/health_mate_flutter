import 'package:flutter/material.dart';

@immutable
class ColorThemeExtension extends ThemeExtension<ColorThemeExtension> {
  final Color primaryBlue;
  final Color amber;
  final Color secondaryColorOrange;
  final Color green;

  final Color white;
  final Color black;
  final Color grey;
  final Color darkGrey;
  final Color lightGrey;
  final Color veryLightGrey;
  final Color darkGreen;
  final Color paleYellow;

  final Color textPrimary;
  final Color textSecondary;
  final Color textLight;
  final Color textDark;

  final Color backgroundLight;
  final Color backgroundDark;
  final Color backgroundGrey;

  final Color transparent;
  final Color shimmerLightGrey;
  final Color shimmerDarkGrey;
  final Color lowOpacityGrey;
  final Color veryLowOpacityGrey;
  final Color lightBlack;
  final Color darkWhite;
  final Color lightPink;
  final Color mintGreen;
  final Color pinkish;
  final Color softYellow;
  final Color lightBlue;

  final Color buttonColor;
  final Color buttonHover;

  final Color lightDarkGray;
  final Color black54;

  const ColorThemeExtension({
    required this.primaryBlue,
    required this.amber,
    required this.secondaryColorOrange,
    required this.green,
    required this.white,
    required this.black,
    required this.grey,
    required this.darkGrey,
    required this.lightGrey,
    required this.veryLightGrey,
    required this.darkGreen,
    required this.paleYellow,
    required this.textPrimary,
    required this.textSecondary,
    required this.textLight,
    required this.textDark,
    required this.backgroundLight,
    required this.backgroundDark,
    required this.backgroundGrey,
    required this.transparent,
    required this.shimmerLightGrey,
    required this.shimmerDarkGrey,
    required this.lowOpacityGrey,
    required this.veryLowOpacityGrey,
    required this.lightBlack,
    required this.darkWhite,
    required this.lightPink,
    required this.mintGreen,
    required this.pinkish,
    required this.softYellow,
    required this.lightBlue,
    required this.buttonColor,
    required this.buttonHover,
    required this.lightDarkGray,
    required this.black54,
  });

  @override
  ColorThemeExtension copyWith() => this;

  @override
  ColorThemeExtension lerp(
      ThemeExtension<ColorThemeExtension>? other, double t) {
    return this;
  }
}
