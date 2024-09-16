import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool('seen_onboarding') ?? false);
  }

  static Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
  }
}
