
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:grocery_app/theme/font_styles/light_font_style/light_font_style.dart';
import 'package:grocery_app/theme/light_base_theme.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: primaryColor,
    hintColor: tertiaryColor,
    indicatorColor: iconColor,

    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor,error: redColor),
    scaffoldBackgroundColor: scaffoldColor,
    buttonTheme: const ButtonThemeData(buttonColor: primaryColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: scaffoldColor,
        textStyle: buttonTextStyle,
      ),
    ),
  );
}