import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/themes/elevated_button_theme.dart';
import 'package:fab_simple/themes/text_theme.dart';
import 'package:flutter/material.dart';
// import 'package:main_app/src/utils/theme/widget_themes/elevated_button_theme.dart';
// import 'package:main_app/src/utils/theme/widget_themes/outlined_button_theme.dart';
// import 'package:main_app/src/utils/theme/widget_themes/text_field_theme.dart';
// import 'package:main_app/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme {
  //private constructor
  AppTheme._();

  // static ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   textTheme: MagicTextTheme.lightTextTheme,
  //   elevatedButtonTheme: MagicElevatedButtonTheme.lightElevatedButtonTheme,
  //   outlinedButtonTheme: MagicOutlinedButtonTheme.lightOutlinedButtonTheme,
  //   inputDecorationTheme: MagicTextFormFieldTheme.lightInputDecorationTheme,
  // );
  static ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    scaffoldBackgroundColor: darkColor,
    textTheme: FABSimpleTextTheme.darkTextTheme,
    elevatedButtonTheme: FABElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: MagicOutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: MagicTextFormFieldTheme.darkInputDecorationTheme,
  );

  // ThemeData(
  //   // primaryColor: AppTheme.magicYellowSwatch,
  //   colorScheme: ColorScheme.fromSwatch(
  //     primarySwatch: AppTheme.magicYellowSwatch,
  //     accentColor: Color(AppTheme.magicNavyHex),
  //   ),
  //   textTheme: const TextTheme(
  //     headline1: TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     headline5: TextStyle(
  //       fontSize: 14,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     headline6: TextStyle(
  //       fontSize: 14,
  //       fontWeight: FontWeight.normal,
  //     ),
  //   ),
  //   // textTheme: GoogleFonts.montserratTextTheme(),
  // );
}

// class AppTheme {
//   static int magicYellowHex = 0xFFE1B16A;
//   static int magicNavyHex = 0xFF444C5C;
//   static int magicRedHex = 0xFFCE5A57;
//   static int magicBlueHex = 0xFF78A5A3;

  // static Map<String, int> magicColorHex = {
  //   'yellow': 0xFFE1B16A,
  //   'navy': 0xFF444C5C,
  //   'red': 0xFFCE5A57,
  //   'blue': 0xFF78A5A3
  // };

//   static MaterialColor getMaterialColorFromHex(colorHex) {
//     return MaterialColor(
//       colorHex,
//       <int, Color>{
//         50: Color(colorHex),
//         100: Color(colorHex),
//         200: Color(colorHex),
//         300: Color(colorHex),
//         400: Color(colorHex),
//         500: Color(colorHex),
//         600: Color(colorHex),
//         700: Color(colorHex),
//         800: Color(colorHex),
//         900: Color(colorHex),
//       },
//     );
//   }

//   static MaterialColor magicYellowSwatch =
//       getMaterialColorFromHex(magicYellowHex);
//   static MaterialColor magicNavySwatch = getMaterialColorFromHex(magicNavyHex);
//   static MaterialColor magicRedSwatch = getMaterialColorFromHex(magicRedHex);
//   static MaterialColor magicBlueSwatch = getMaterialColorFromHex(magicBlueHex);
// }
