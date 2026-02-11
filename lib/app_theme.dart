import 'package:flutter/material.dart';

class AppTheme {
  static const Color primry = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color wihte = Color(0xffffffff);

  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    primaryColor: primry,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primry,
      selectedItemColor: wihte,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
    ),
  );
}
