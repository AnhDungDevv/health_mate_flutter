import 'package:flutter/material.dart';

class ColorManager {
  // Primary Colors
  static const Color primaryColorBlue = Color(0xFF3E61FF);
  static const Color amberYellow = Color(0xFFFFC107);
  static const Color secondaryColorOrange =
      Color(0xFFF47839); // orange as error
  static const Color successColor = Color(0xFF37AA65); // green as success

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFF969696); // gray instead of grey
  static const Color darkGray = Color(0xFF424242); // darkGray
  static const Color lightGray = Color(0xFFE6E6E6); // lightGray
  static const Color veryLightGray = Color(0xFFF3F3F3); // veryLightGray
  static const Color darkGreen = Color(0xFF098E46);
  static const Color paleYellow = Color(0xFFFDE38C);

  // Text Colors
  static const Color textPrimary = black;
  static const Color textSecondary = gray;
  static const Color textLight = Color(0xFFB0B0B0);
  static const Color textDark = darkGray;

  // Background Colors
  static const Color backgroundLight = white;
  static const Color backgroundDark = black;
  static const Color backgroundGray = veryLightGray; // updated for consistency

  // Transparent & Shimmer Colors
  static const Color transparent = Colors.transparent;
  static const Color shimmerLightGray = Color(0xFFD3D3D3);
  static const Color shimmerDarkGray = Color(0xFF616161);
  static const Color lowOpacityGray = Color(0x1A000000); // low opacity gray
  static const Color veryLowOpacityGray =
      Color(0x0F000000); // very low opacity gray

  // Miscellaneous Colors
  static const Color lightBlack = Color(0xFF1C1C1C);
  static const Color lightWhite =
      Color(0xFFF1F1F1); // darkWhite changed to lightWhite
  static const Color lightPink = Color(0xFFF68A8A);
  static const Color mintGreen = Color(0xFFCAFFE5);
  static const Color pinkish = Color(0xFFFFCACA);
  static const Color softYellow = Color(0xFFFFE8E8);
  static const Color lightBlue = Color(0xFFEFF2FF);

  // Button Colors
  static const Color primaryButtonColor =
      primaryColorBlue; // updated for clarity
  static const Color buttonHoverColor = Color(0xFF2C4DFF);

  // Dark Mode Background
  static const Color darkBackgroundGray =
      Color(0xFF303030); // lightDarkGray changed to darkBackgroundGray
  static const Color black54 = Color(0x8A000000); // Black with 54% opacity
}
