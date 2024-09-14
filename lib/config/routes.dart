import 'package:flutter/material.dart';
import 'package:recipe_app/screens/splash_screen.dart';
import 'package:recipe_app/screens/onboarding_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String search = '/search';
  static const String recipeDetail = '/recipe-detail';
  static const String bookmark = '/bookmark';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
  };
}