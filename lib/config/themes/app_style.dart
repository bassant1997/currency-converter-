import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const primaryColor = Color(0xff1679AB);
  static const whiteColor = Color(0xffffffff);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff1679AB),
  );
}
