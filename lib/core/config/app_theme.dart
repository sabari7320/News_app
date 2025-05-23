import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: Colors.red[600]),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 89, 88, 88),
    ),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
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

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: const Color.fromARGB(255, 243, 131, 123)),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 246, 242, 242),
    ),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
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
