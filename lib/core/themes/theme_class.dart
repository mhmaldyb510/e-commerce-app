import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  final ThemeData _baseTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    fontFamily: GoogleFonts.cairo().fontFamily,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.kPrimaryColor,
        backgroundColor: AppColors.green1_50,
        iconSize: 20,
        padding: const EdgeInsets.all(20)
      )
    )
  );

  ThemeData get baseTheme => _baseTheme;
}
