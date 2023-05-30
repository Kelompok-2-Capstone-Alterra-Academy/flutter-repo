import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils {
  static late SharedPreferences prefs;
  // make constructor async

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> savePreferencesString(String key, String value) async {
    prefs.setString(key, value);
  }

  String? getPreferencesString(String key) {
    return prefs.getString(key);
  }

  Future<void> savePreferencesBool(String key, bool value) async {
    prefs.setBool(key, value);
  }

  bool? getPreferencesBool(String key) {
    return prefs.getBool(key);
  }

  Future<void> removePreferences(String key) async {
    await prefs.remove(key);
  }
}
