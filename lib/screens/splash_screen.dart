import 'package:flutter/material.dart';
import 'dart:async'; // Untuk fungsi Timer

import 'package:ic_care/screens/login_screen.dart'; // Nanti kita buat halaman login_screen.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mengatur timer untuk pindah halaman setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700, // Warna latar belakang splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder untuk Logo
            // Anda bisa mengganti ini dengan Image.asset('assets/images/logo.png')
            // jika Anda memiliki file logo di folder assets.
            Icon(
              Icons.healing, // Contoh ikon, bisa diganti nanti dengan logo Anda
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'IC-CARE',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2, // Memberikan sedikit jarak antar huruf
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pikiran Sehat Hidup Berarti',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}