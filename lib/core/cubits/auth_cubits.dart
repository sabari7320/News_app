import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthStatus> {
  AuthCubit() : super(AuthStatus.unknown) {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final _prefs = await SharedPreferences.getInstance();
    final isLoggedIn = _prefs.getBool('userlogin') ?? false;
    emit(isLoggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated);
  }

  Future<void> logout() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('userlogin', false);
    emit(AuthStatus.unauthenticated);
  }

  void loginSuccess() {
    emit(AuthStatus.authenticated);
  }
}
