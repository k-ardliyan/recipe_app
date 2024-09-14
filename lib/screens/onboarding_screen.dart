import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip action
            },
            child: const Text('Skip', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/chef_illustration.png',
              height: 200,
            ),
            const SizedBox(height: 40),
            const Text(
              'Thousands of tested recipes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'There is no need to learn to cook. Tested recipes are guaranteed to work by our professional chefs.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle get started action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}