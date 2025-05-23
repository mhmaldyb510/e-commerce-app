import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/theme_class.dart';
import 'package:flutter/material.dart';

class LightTheme extends ThemeClass {
  ThemeData getThemeData() => super.baseTheme.copyWith(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xffF3F5F7),
        foregroundColor: AppColors.kPrimaryColor,
      ),
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: AppColors.kPrimaryColor,
      secondary: Color(0xffF3F5F7),
    ),

    hintColor: AppColors.grayscale400,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.grayscale950),
      bodyMedium: TextStyle(color: AppColors.grayscale950),
      bodyLarge: TextStyle(color: AppColors.grayscale950),
    ),
  );
}
