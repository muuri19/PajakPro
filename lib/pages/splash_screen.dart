import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';

import 'package:pajakpro/pages/navigation_page.dart'; // Untuk delay

class SplashScreen extends StatefulWidget {
  static const routeName = 'splashscreen';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer untuk melakukan navigasi ke halaman utama setelah beberapa detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(NavigationPage
          .routeName); // Ganti '/home' dengan route halaman utama Anda
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900, // Sesuaikan warna latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo di tengah
            Image.asset('assets/logo/pajakpro-logo-nobg.png',
                width: 150, height: 150),

            const SizedBox(height: 20),

            // Teks di bawah logo
            _buildLoading(context)
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
