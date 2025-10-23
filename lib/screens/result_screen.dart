import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("id-ID"); // 🔹 Bahasa Indonesia
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speak() async {
    if (widget.ocrText.isNotEmpty) {
      await flutterTts.speak(widget.ocrText);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada teks untuk dibacakan.')),
      );
    }
  }

  @override
  void dispose() {
    flutterTts.stop(); // 🔹 hentikan TTS saat halaman ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        backgroundColor: const Color(0xFF2196F3),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up, color: Colors.white),
            onPressed: _speak, // 🔹 Tombol suara di AppBar
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : widget.ocrText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ),

      // 🔹 FloatingActionButton kembali ke HomeScreen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
