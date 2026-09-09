import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightAccent,
        surface: AppColors.lightSurface,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.w600),
        titleLarge: GoogleFonts.inter(color: AppColors.lightPrimaryText, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.inter(color: AppColors.lightSecondaryText),
        bodyMedium: GoogleFonts.inter(color: AppColors.lightSecondaryText),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkAccent,
        surface: AppColors.darkSurface,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.w600),
        titleLarge: GoogleFonts.inter(color: AppColors.darkPrimaryText, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.inter(color: AppColors.darkSecondaryText),
        bodyMedium: GoogleFonts.inter(color: AppColors.darkSecondaryText),
      ),
      useMaterial3: true,
    );
  }
}
