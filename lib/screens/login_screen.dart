import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Ganti dengan alamat lokal kamu
  final String apiUrl = "http://localhost/dataocr/get_user.php";
  // pakai 10.0.2.2 kalau di emulator Android

  Future<void> _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Harap isi semua field")));
      return;
    }

    try {
      // Menggunakan GET untuk mengambil semua data pengguna dari PHP
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // PHP mengembalikan sebuah list/array pengguna
        final List<dynamic> users = jsonDecode(response.body);

        // Cari pengguna berdasarkan username yang diinput
        var userFound = users.firstWhere(
          (user) => user['username'] == _usernameController.text,
          orElse: () => null, // Kembalikan null jika tidak ada yang cocok
        );

        // Jika pengguna ditemukan, periksa passwordnya
        if (userFound != null) {
          if (userFound['password'] == _passwordController.text) {
            // Login berhasil
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login berhasil!")));
            Navigator.pushReplacementNamed(context, '/splash');
          } else {
            // Password salah
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Password salah")));
          }
        } else {
          // Username tidak ditemukan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Username tidak ditemukan")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Gagal mengambil data: ${response.statusCode}"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal terhubung ke server: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('OCR Scanner'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.lock_open_rounded,
                color: Colors.blue,
                size: 100,
              ),
              const SizedBox(height: 40),

              // Username
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email atau Username',
                  prefixIcon: const Icon(Icons.person, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.vpn_key, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Remember Me + Forgot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        activeColor: Colors.blueAccent,
                      ),
                      const Text('Ingat Saya'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Tombol Login
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('MASUK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
