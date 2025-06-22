import 'package:flutter/material.dart';
import 'package:ic_care/screens/splash_screen.dart'; // Import SplashScreen kita

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IC-Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Mengatur SplashScreen sebagai halaman awal
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}