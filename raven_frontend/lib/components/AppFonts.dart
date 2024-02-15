import 'package:flutter/material.dart';

class AppFonts {
  static const String _primaryFont = 'OpenSans';
  static const String welcometxt = 'Raleway';
  static const String welcometxt1 = 'NotoSerif';

  static TextStyle heading1Font({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w900,
    double fontSize = 45.0,

  }) {
    return TextStyle(
      fontFamily:_primaryFont ,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle heading2Font({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 20.0,
  }) {
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
//  fonts for body
  static TextStyle bodyTextFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 16.0,
  }) {
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

// font for page titles
  static TextStyle PageTitleFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 20.0,
  }) {
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  // font for buttons
  static TextStyle ButtonFont({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 20.0,
  }) {
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}