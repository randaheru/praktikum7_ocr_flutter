import 'package:flutter/material.dart';
import 'screens/scan_screen.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OCR App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const HomeScreen(),
        '/scan': (_) => const ScanScreen(),
        '/result': (_) => const ResultScreen(ocrText: ''),
      },
    );
  }
}
