import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/cubits/auth_cubits.dart';
import 'package:news_app/feature/auth/presentation/pages/signup.dart';
import 'package:news_app/feature/news/presentation/pages/news_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //loadSplash();
  }

  // // Load the splash screen for some duration
  // Future<Timer> loadSplash() async {
  //   return Timer(const Duration(seconds: 10), onDoneLoading);
  // }

  // onDoneLoading() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: ((context) => const SignupPage())),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStatus>(
        listener: (context, state) {
          if (state == AuthStatus.authenticated) {
            Navigator.pushReplacement(
              context,
              (MaterialPageRoute(builder: (_) => NewsScreen())),
            );
          } else if (state == AuthStatus.unauthenticated) {
            Navigator.pushReplacement(
              context,
              (MaterialPageRoute(builder: (_) => SignupPage())),
            );
          }
        },
        child: Center(
          child: Lottie.asset(
            "assets/news_splash.json",
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}



// return Center(
//             child: Lottie.asset(
//               "assets/news_splash.json",
//               fit: BoxFit.cover,
//               width: 300,
//               height: 300,
//             ),
//           );