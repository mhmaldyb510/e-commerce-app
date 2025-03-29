import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const Color primaryColor = Color(0xff1B5E37);
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.cairo().fontFamily,
    primaryColor: primaryColor,
  );
}
