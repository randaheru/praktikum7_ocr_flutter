import 'package:flutter/material.dart';
import 'screens/scan_screen.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart'; // 💡 Tambahkan import untuk LoginScreen

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
        // Menggunakan Teal agar konsisten dengan desain Login & Splash Screen yang kita buat
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), 
        useMaterial3: true,
      ),
      
      // ➡️ Halaman awal yang pertama kali dimuat adalah LoginScreen
      initialRoute: '/login', 
      
      routes: {
        '/login': (_) => const LoginScreen(),     // 🆕 Route untuk Halaman Login
        '/splash': (_) => const SplashScreen(),   // 🆕 Route untuk Halaman Splash
        '/home': (_) => const HomeScreen(),
        '/scan': (_) => const ScanScreen(),
        // Catatan: '/result' perlu menerima argumen untuk ocrText
        '/result': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String? ?? '';
          return ResultScreen(ocrText: args);
        },
      },
      // Halaman yang ditampilkan jika rute awal tidak ditemukan (opsional, tapi bagus)
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }
}