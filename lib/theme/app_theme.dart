import 'package:ant/theme/constants/project_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  Color primaryColor = cRed;
  Color secondaryColor = cYellow;
  Color tertiaryColor = cBlack;

  static const buttonTextFamily = 'Raleway';
  static const double buttonFontSizeLarge = 20;
  static const double buttonFontSizeMedium = 16;
  static const double buttonFontSizeSmall = 12;
  static const buttonFontWeight = FontWeight.w400;

  static var largeButtonTextStyle = const TextStyle(
    fontFamily: buttonTextFamily,
    fontSize: buttonFontSizeLarge,
  );
  static var mediumButtonTextStyle = const TextStyle(
    fontFamily: buttonTextFamily,
    fontSize: buttonFontSizeMedium,
  );
  static var smallButtonTextStyle = const TextStyle(
    fontFamily: buttonTextFamily,
    fontSize: buttonFontSizeSmall,
  );
}
