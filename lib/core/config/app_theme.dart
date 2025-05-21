import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: Colors.red[600]),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 222, 90, 90),
    ),
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: Colors.red[600]),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.redAccent,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 124, 127, 127),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: const Color.fromARGB(221, 230, 80, 80)),
      hintStyle: TextStyle(color: const Color.fromARGB(255, 220, 93, 93)),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 60),
        backgroundColor: Colors.redAccent, // Button background color
        foregroundColor: Colors.white, // Text/icon color
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
