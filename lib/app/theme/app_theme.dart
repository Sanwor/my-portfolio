import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'app_fonts.dart';

export 'app_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: AppFonts.interFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightAccent,
        surface: AppColors.lightSurface,
      ),
      textTheme: AppFonts.interTextTheme().copyWith(
        displayLarge: AppFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        displayMedium: AppFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        displaySmall: AppFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        headlineMedium: AppFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.w600),
        titleLarge: AppFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.w600),
        bodyLarge: AppFonts.inter(color: AppColors.lightSecondaryText),
        bodyMedium: AppFonts.inter(color: AppColors.lightSecondaryText),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: AppFonts.interFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkAccent,
        surface: AppColors.darkSurface,
      ),
      textTheme: AppFonts.interTextTheme().copyWith(
        displayLarge: AppFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        displayMedium: AppFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        displaySmall: AppFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        headlineMedium: AppFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.w600),
        titleLarge: AppFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.w600),
        bodyLarge: AppFonts.inter(color: AppColors.darkSecondaryText),
        bodyMedium: AppFonts.inter(color: AppColors.darkSecondaryText),
      ),
      useMaterial3: true,
    );
  }
}
