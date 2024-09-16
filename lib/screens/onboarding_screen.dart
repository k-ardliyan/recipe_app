import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:recipe_app/data/models/onboarding_model.dart';
import 'package:recipe_app/data/onboarding_data.dart';
import 'package:recipe_app/utils/shared_prefs.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void onGetStartedPressed() async {
    await SharedPrefs.setOnboardingSeen();
    if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.grey[400],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: onGetStartedPressed,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingContents.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return buildOnboardingPage(onboardingContents[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingContents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == onboardingContents.length - 1) {
                        onGetStartedPressed();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      _currentPage == onboardingContents.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(OnboardingModel content) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            content.image,
            height: 164,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 46),
          Text(
            content.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 270,
            child: Text(
              content.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: _currentPage == index ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
