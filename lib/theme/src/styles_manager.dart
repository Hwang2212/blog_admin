import 'dart:ui';

import 'package:arrivo_web/theme/src/app_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.regular);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.light);
}

TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.extraLight);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.medium);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.semiBold);
}

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.bold);
}

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.extraBold);
}
