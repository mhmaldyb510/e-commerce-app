import 'package:e_commerce_app/core/themes/theme_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme extends ThemeClass {
  static const Color primaryColor = Color(0xff1B5E37);
  @override
  ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,

      colorScheme: ColorScheme.light(primary: primaryColor),
      fontFamily: GoogleFonts.cairo().fontFamily,
      primaryColor: primaryColor,
    );
  }
}
