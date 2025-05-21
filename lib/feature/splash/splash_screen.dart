import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/feature/auth/presentation/pages/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  // Load the splash screen for some duration
  Future<Timer> loadSplash() async {
    return Timer(const Duration(seconds: 10), onDoneLoading);
  }

  onDoneLoading() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: ((context) => const SignupPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/news_splash.json",
          fit: BoxFit.cover,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
