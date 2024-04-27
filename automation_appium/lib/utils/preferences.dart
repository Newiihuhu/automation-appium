import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String onboardingCompleteKey = 'onboardingComplete';
  static const String userUID = 'userUID';

  static Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingCompleteKey) ?? false;
  }

  static Future<void> setOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingCompleteKey, true);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userUID) != null &&
        prefs.getString(userUID)!.isNotEmpty;
  }

  static Future<void> setLoggedIn(String isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userUID, isLoggedIn);
  }

  static Future<String> getUserUID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userUID) ?? '';
  }
}
