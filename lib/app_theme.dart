import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static Color primarylight = Color(0xFFB7935F);
  static Color black = Color(0xFF242424);
  static Color white = Colors.white;

  static ThemeData lighttheme = ThemeData(
      primaryColor: primarylight,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: black)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primarylight,
          //   selectedIconTheme:IconThemeData(color: black,) ,
          //  selectedLabelStyle: TextStyle(color: black),
          //   unselectedLabelStyle: TextStyle(color: white),
          selectedItemColor: black,
          unselectedItemColor: white),
      textTheme: TextTheme(
        headlineSmall:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: black),
            titleLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.w400, color: black )
      ));

  static ThemeData darktheme = ThemeData();
}
