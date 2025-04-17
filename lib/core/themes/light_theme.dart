import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/theme_class.dart';
import 'package:flutter/material.dart';

class LightTheme extends ThemeClass {
  ThemeData getThemeData() => super.baseTheme.copyWith(
    brightness: Brightness.light,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xffF3F5F7),
        foregroundColor: AppColors.kPrimaryColor,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      secondary: Color(0xffF3F5F7),
    ),
    hintColor: AppColors.grayscale400,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.grayscale950),
      bodyLarge: TextStyle(color: AppColors.grayscale950),
    ),
  );
}
