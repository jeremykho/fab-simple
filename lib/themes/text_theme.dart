import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FABSimpleTextTheme {
  FABSimpleTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 120.0, fontWeight: FontWeight.w500, color: lightColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 44.0, fontWeight: FontWeight.w500, color: lightColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.w700, color: darkColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: darkColor),
    // headline5: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: whiteColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: lightColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: lightColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: darkColor),
    // subtitle2: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
  );
}
