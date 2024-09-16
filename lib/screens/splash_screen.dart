import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recipe_app/config/app_config.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:recipe_app/gen/assets.gen.dart';
import 'package:recipe_app/utils/shared_prefs.dart';

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
      checkFirstSeen();
    });
  }

  Future<void> checkFirstSeen() async {
    bool isFirstTime = await SharedPrefs.isFirstTime();

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        isFirstTime ? AppRoutes.onboarding : AppRoutes.home,
      );
    }
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
