import 'package:flutter/material.dart';
import 'dart:async';
import 'package:recipe_app/config/app_config.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:recipe_app/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: AppConfig.splashDuration), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Assets.images.logoRecipeApp.image(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
