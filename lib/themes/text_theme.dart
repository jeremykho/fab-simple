import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FABSimpleTextTheme {
  FABSimpleTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 120.0, fontWeight: FontWeight.w500, color: lightColor),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 36.0, fontWeight: FontWeight.w500, color: lightColor),
    displaySmall: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.w600, color: lightColor),
    headlineMedium: GoogleFonts.montserrat(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: darkColor),
    titleLarge: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: lightColor),
    bodyLarge: GoogleFonts.montserrat(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: lightColor),
    bodyMedium: GoogleFonts.montserrat(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: darkColor),
  );
}
