import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background gradasi biru
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F51B5), Color(0xFF2196F3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animasi Lottie
                  Lottie.asset(
                    'assets/Lottie/Camera.json',
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // Judul
                  const Text(
                    'Selamat Datang di OCR Scanner',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Pindai teks dari gambar dengan cepat dan mudah!',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Tombol (ListTile) dibuat lebih kecil
                  SizedBox(
                    width: 220, // 🔹 Lebar tombol lebih kecil
                    height: 50, // 🔹 Tinggi tombol lebih kecil
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 5,
                      child: ListTile(
                        dense: true, // 🔹 Membuat ListTile lebih ramping
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        leading: const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Mulai Pindai Teks Baru',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ScanScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
