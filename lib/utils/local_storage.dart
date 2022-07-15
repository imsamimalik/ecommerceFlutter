import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  late bool isVerified;
  static saveStr(String key, String message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, message);
  }

  static readPrefStr(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static bool isUserVerified() {
    var isVerified = readPrefStr('token').then((v) => v);
    print(isVerified);
    return isVerified;
  }

}
