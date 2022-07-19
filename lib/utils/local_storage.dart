import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static saveStr(String key, String message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, message);
  }

  static Future<String> readPrefStr(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String value = pref.getString(key) ?? "";
    return value;
  }

}
