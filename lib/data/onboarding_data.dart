import 'package:recipe_app/data/models/onboarding_model.dart';
import 'package:recipe_app/gen/assets.gen.dart';

final List<OnboardingModel> onboardingContents = [
  OnboardingModel(
    title: "Thousands of tested recipes",
    description:
        "There is no need to learn to cook. Tested recipes are guaranteed to work by our professional chefs.",
    image: Assets.images.onboarding1.path,
  ),
  OnboardingModel(
    title: "Cook with confidence",
    description:
        "Step-by-step instructions and video tutorials make cooking easy and fun.",
    image: Assets.images.onboarding1.path,
  ),
  OnboardingModel(
    title: "Save your favorites",
    description:
        "Bookmark your favorite recipes and access them anytime, even offline.",
    image: Assets.images.onboarding1.path,
  ),
];
