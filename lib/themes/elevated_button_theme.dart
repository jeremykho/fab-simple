import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/themes/text_theme.dart';
import 'package:flutter/material.dart';

class FABElevatedButtonTheme {
  FABElevatedButtonTheme._();

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: darkColor,
      backgroundColor: yellowColor,
      side: const BorderSide(color: yellowColor),
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      textStyle: FABSimpleTextTheme.darkTextTheme.headlineMedium,
    ),
  );

  // static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     elevation: 0,
  //     foregroundColor: whiteColor,
  //     backgroundColor: secondaryColor,
  //     side: const BorderSide(color: secondaryColor),
  //     padding: const EdgeInsets.symmetric(vertical: buttonHeight),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  //   ),
  // );
}
