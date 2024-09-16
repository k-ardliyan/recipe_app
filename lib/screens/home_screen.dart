import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.clear();
              });
              Navigator.pushReplacementNamed(context, AppRoutes.splash);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
