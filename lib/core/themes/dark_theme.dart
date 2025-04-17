import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/theme_class.dart';
import 'package:flutter/material.dart';

class DarkTheme extends ThemeClass {
  static const Color primaryColor = Color(0xff1B5E37);

  ThemeData getThemeData() => super.baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff0D0D0D),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xff171717),
        foregroundColor: AppColors.kPrimaryColor,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: Color(0xff171717),
    ),
    hintColor: const Color(0xff949d9e),
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
  );
}
