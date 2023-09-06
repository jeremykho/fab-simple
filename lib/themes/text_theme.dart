import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FABSimpleTextTheme {
  FABSimpleTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    // Life Counter
    displayLarge: GoogleFonts.montserrat(
        fontSize: 120.0, fontWeight: FontWeight.w500, color: lightColor),
    // Damage, Life History, Energy, info Button
    displayMedium: GoogleFonts.montserrat(
        fontSize: 40.0, fontWeight: FontWeight.w500, color: lightColor),
    // Blitz & CC Button
    displaySmall: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: lightColor),
    // Paypal Button, Donate Prompt, Die Reroll, Confirm Restart, Restart Prompt
    headlineMedium: GoogleFonts.montserrat(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: darkColor),
    titleLarge: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: lightColor),
    // Restart text
    bodyLarge: GoogleFonts.montserrat(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: darkColor),
    // Info text
    bodyMedium: GoogleFonts.montserrat(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: darkColor),
  );
}
