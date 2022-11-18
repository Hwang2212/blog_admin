import 'package:Blog_web/screens/screens.dart';
import 'package:Blog_web/theme/src/app_colors.dart';
import 'package:Blog_web/theme/src/app_fonts.dart';
import 'package:Blog_web/theme/src/app_size.dart';
import 'package:Blog_web/theme/src/styles_manager.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(TextTheme textTheme) {
  return ThemeData(
      // Colors
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.lightPrimary,
      disabledColor: AppColors.grey,
      backgroundColor: AppColors.primary,

      // Ripple Color
      splashColor: AppColors.lightPrimary,

      // CardView
      cardTheme: CardTheme(
          color: AppColors.white,
          shadowColor: AppColors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: AppSize.s3),

      // AppBar
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.primary),
          color: AppColors.white,
          elevation: AppSize.s3,
          shadowColor: AppColors.extraLightPrimary,
          titleTextStyle:
              getRegularStyle(color: AppColors.black, fontSize: FontSize.s16)),
      drawerTheme: const DrawerThemeData(),

      // Button Theme
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(),
          disabledColor: AppColors.grey,
          buttonColor: AppColors.primary,
          splashColor: AppColors.lightPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(fontSize: 16, color: AppColors.white),
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.grey,
              minimumSize: const Size(20, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      //DataTable Theme
      dataTableTheme: DataTableThemeData(
          headingRowHeight: AppSize.s80,
          headingTextStyle: textTheme.bodyMedium,
          dataTextStyle: textTheme.labelLarge),

      // Text Theme
      textTheme: textTheme,

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
          errorStyle: getLightStyle().copyWith(color: AppColors.red),
          labelStyle: getMediumStyle(fontSize: 20.0, color: AppColors.black),
          constraints: const BoxConstraints(minWidth: 500, maxWidth: 800),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 2))));
}

class AppThemes {
  static TextTheme textTheme = TextTheme(
      headlineLarge:
          getExtraBoldStyle(color: AppColors.black, fontSize: FontSize.s40),
      bodyLarge:
          getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s30),
      bodyMedium:
          getRegularStyle(color: AppColors.black, fontSize: FontSize.s20),
      labelSmall:
          getLightStyle(color: AppColors.black, fontSize: FontSize.s12));
}
