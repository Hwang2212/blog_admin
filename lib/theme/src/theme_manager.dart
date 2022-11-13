import 'package:arrivo_web/screens/screens.dart';
import 'package:arrivo_web/theme/src/app_colors.dart';
import 'package:arrivo_web/theme/src/app_fonts.dart';
import 'package:arrivo_web/theme/src/app_size.dart';
import 'package:arrivo_web/theme/src/styles_manager.dart';
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
          iconTheme: IconThemeData(color: AppColors.primary),
          color: AppColors.white,
          elevation: AppSize.s3,
          shadowColor: AppColors.extraLightPrimary,
          titleTextStyle:
              getRegularStyle(color: AppColors.black, fontSize: FontSize.s16)),
      drawerTheme: DrawerThemeData(),

      // Button Theme
      buttonTheme: ButtonThemeData(
          shape: const RoundedRectangleBorder(),
          disabledColor: AppColors.grey,
          buttonColor: AppColors.primary,
          splashColor: AppColors.lightPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: AppColors.white),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      //DataTable Theme
      dataTableTheme: DataTableThemeData(dataTextStyle: textTheme.labelSmall),

      // Text Theme
      textTheme: textTheme
      // InputFields Theme
      );
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
