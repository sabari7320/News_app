import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/app_theme.dart';
import 'package:news_app/core/di/injector.dart' as di;
import 'package:news_app/core/services/notification/firebase_msg.dart';
import 'package:news_app/core/services/notification/notification_screen.dart';
import 'package:news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/feature/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMsg().initializeFCM();
  await di.configureDependencies();
  // await FirebaseMsg().initFCM();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<AuthBLoc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: AppTheme.light,
        home: SplashScreen(),
      ),
    );
  }
}
