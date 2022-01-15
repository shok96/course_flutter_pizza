import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constantsTheme.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    scaffoldBackgroundColor: Colors.lightBlue,
      unselectedWidgetColor: Colors.red,
      toggleableActiveColor: Colors.yellow,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: violetDark,
        elevation: 0),
    colorScheme: ColorScheme.dark(
      secondary: Colors.black,
      surface: Colors.white,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: Colors.black,

    textTheme: GoogleFonts.robotoTextTheme().copyWith(bodyText2: TextStyle(color: violetDark))
  );
}

