import 'package:flutter/material.dart';

class ColorName {
  static const MaterialColor themeColor =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE5F4F3),
    100: Color(0xFFBEE4E1),
    200: Color(0xFF93D3CD),
    300: Color(0xFF67C1B8),
    400: Color(0xFF47B3A9),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF229E92),
    700: Color(0xFF1C9588),
    800: Color(0xFF178B7E),
    900: Color(0xFF0D7B6C),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF26A69A;

  static const MaterialColor accentColor =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFADFFF3),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF47FFE4),
    700: Color(0xFF2DFFE0),
  });
  static const int _mcgpalette0AccentValue = 0xFF7AFFEC;

  static const unselectedColor = Color.fromARGB(255, 104, 104, 104);
}
