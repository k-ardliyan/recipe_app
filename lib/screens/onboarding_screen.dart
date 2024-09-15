import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:recipe_app/gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: "Thousands of tested recipes",
      description:
          "There is no need to learn to cook. Tested recipes are guaranteed to work by our professional chefs.",
      image: Assets.images.onboarding1.path,
    ),
    OnboardingContent(
      title: "Cook with confidence",
      description:
          "Step-by-step instructions and video tutorials make cooking easy and fun.",
      image: Assets.images.onboarding1.path,
    ),
    OnboardingContent(
      title: "Save your favorites",
      description:
          "Bookmark your favorite recipes and access them anytime, even offline.",
      image: Assets.images.onboarding1.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollBehavior: const MaterialScrollBehavior(),
                controller: _pageController,
                itemCount: _contents.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _contents[index].image,
                          height: 200,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          _contents[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _contents[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      _contents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _contents.length - 1) {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      _currentPage == _contents.length - 1
                          ? "Get Started"
                          : "Next",
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

  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: _currentPage == index ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.orange : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final String image;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}
