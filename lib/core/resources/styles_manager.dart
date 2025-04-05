import 'package:flutter/material.dart';
import 'package:health_mate/core/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, FontStyle fontStyle) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle);
}

TextStyle _whichTextStyle(
    double? fontSize, FontWeight fontWeight, Color color, FontStyle fontStyle) {
  double finalFontSize = fontSize ?? FontSize.s14;
  return _getTextStyle(finalFontSize, fontWeight, color, fontStyle);
}

TextStyle getLightStyle(
    {double? fontSize,
    required Color color,
    FontStyle fontStyle = FontStyle.normal}) {
  return _whichTextStyle(fontSize, FontWeightManager.light, color, fontStyle);
}

TextStyle getNormalStyle(
    {double? fontSize,
    required Color color,
    FontStyle fontStyle = FontStyle.normal}) {
  return _whichTextStyle(fontSize, FontWeightManager.regular, color, fontStyle);
}

TextStyle getMediumStyle(
    {double? fontSize,
    required Color color,
    FontStyle fontStyle = FontStyle.normal}) {
  return _whichTextStyle(fontSize, FontWeightManager.medium, color, fontStyle);
}

TextStyle getBoldStyle(
    {double? fontSize,
    required Color color,
    FontStyle fontStyle = FontStyle.normal}) {
  return _whichTextStyle(fontSize, FontWeightManager.bold, color, fontStyle);
}
