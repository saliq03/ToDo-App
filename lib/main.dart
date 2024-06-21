import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskly/splash_screen.dart';
import 'package:taskly/widgets/materialtab.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDm_JdmBq6v49avTSJYmzTrf4m2_1PAM4w",
          appId: "1:157803298556:android:8622845b3e2f5a72a56179",
          messagingSenderId:"157803298556",
          projectId: "taskly-65698")
    ): await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: MystreamBuilder(day: "Today"),
    );
  }
}




