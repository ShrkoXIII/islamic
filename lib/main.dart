import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/taps/quran/surah_details_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SurahDetailsScreen.routename: (_) => SurahDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}
