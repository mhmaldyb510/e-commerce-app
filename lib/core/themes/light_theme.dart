import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/theme_class.dart';
import 'package:flutter/material.dart';

class LightTheme extends ThemeClass {

  ThemeData getThemeData() =>super.baseTheme.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: AppColors.kPrimaryColor),
    hintColor: AppColors.grayscale400,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.grayscale950),
      bodyLarge: TextStyle(color: AppColors.grayscale950),
    ),
  );
}
