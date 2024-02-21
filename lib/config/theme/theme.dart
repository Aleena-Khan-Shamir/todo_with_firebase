import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: GoogleFonts.dekko().fontFamily,
    scaffoldBackgroundColor: AppColor.primaryColor,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryColor,
        onPrimary: Colors.white,
        secondary: Colors.cyan.shade200,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontWeight: FontWeight.bold),
        headlineSmall:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        titleLarge:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
  );
}
