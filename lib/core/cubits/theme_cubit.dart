import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/app_theme.dart';
import "package:shared_preferences/shared_preferences.dart";

class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(AppTheme.light) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required Brightness brightness}) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('theme', themeIndex);
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = _prefs.getInt('theme') ?? 0;
    final savedTheme = savedThemeIndex == 0 ? AppTheme.light : AppTheme.dark;
    emit(savedTheme);
  }

  void clickTheme() {
    emit(state.brightness == Brightness.light ? AppTheme.dark : AppTheme.light);
    _saveThemeToPrefs(brightness: state.brightness);
  }
}
