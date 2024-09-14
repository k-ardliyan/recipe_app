import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child:  Icon(
          Icons.fastfood,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}