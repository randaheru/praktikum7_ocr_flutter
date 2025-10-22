import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        backgroundColor: const Color(0xFF2196F3),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            // 🔹 Tampilkan teks utuh (hapus replaceAll)
            ocrText.isEmpty ? 'Tidak ada teks ditemukan.' : ocrText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ),

      // 🔹 Tambahkan FloatingActionButton untuk kembali ke HomeScreen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false, // menghapus semua halaman sebelumnya
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}

