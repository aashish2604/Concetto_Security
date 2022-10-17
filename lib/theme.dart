import 'package:concetto_security/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData() {
    // BuildContext? context = navigatorKey.currentContext;
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              backgroundColor: kBrightCyan,
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              textStyle: GoogleFonts.quantico(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  letterSpacing: 0.5))),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 0),
      scaffoldBackgroundColor: kCoolGrey,
    );
  }
}
