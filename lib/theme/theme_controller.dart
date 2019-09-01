//theme_controller.dart
import 'package:custom_theme_demo/theme/dark_theme.dart';
import 'package:flutter/material.dart';

import 'light_theme.dart';
class ThemeTypeEnum{
  static const Light=ThemeTypeEnum("light");
  static const Dark=ThemeTypeEnum("dark");

  static const allType=[Light,Dark];
  final String _themeKey;

  const ThemeTypeEnum(this._themeKey);
  String get themeKey => _themeKey;

  static fromThemeKey(String themeKey){
    return allType.firstWhere((t) => t._themeKey==themeKey);
  }
}

ThemeData themeProvider(BuildContext context,ThemeTypeEnum theme){
 if(theme==ThemeTypeEnum.Dark) return darkTheme();
 else return lightTheme();
}