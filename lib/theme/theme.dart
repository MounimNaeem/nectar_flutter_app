import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/enums/app_enums.dart';
import 'package:grocery_app/theme/available_themes/light_theme.dart';

class AppTheme {
  static ThemeData getTheme({AllThemes theme = AllThemes.light}) {
    switch (theme) {
      case AllThemes.light:
        return LightTheme().theme;
      default:
        return LightTheme().theme;
    }
  }
}
